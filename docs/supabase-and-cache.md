## Supabase и кэширование

Цель: одинаковый подход к работе с Supabase и локальным кэшем во всех фичах.

---

### Supabase: общие правила

- В `presentation` и `domain` мы **не импортируем** `supabase_flutter`.
- Весь код, который знает про Supabase, лежит в слое `data` (и частично в `core/network`).
- Во внешнем коде мы работаем через:
  - `AuthRepository`, `TransactionsRepository` и т.п.;
  - `Result<DomainEntity>` и `Failure`.

### SupabaseClientProvider

Файл: `core/network/supabase_client_provider.dart`.

- Отвечает за доступ к `Supabase.instance.client` через DI.
- Используем `SupabaseFlutter.initialize` в `main.dart` **до** вызова `configureDependencies()`.

Шаблон использования:

```dart
@LazySingleton(as: SomeRepository)
class SupabaseSomeRepository implements SomeRepository {
  const SupabaseSomeRepository(this._provider);

  final SupabaseClientProvider _provider;

  SupabaseClient get _client => _provider.client;

  // дальше методы, использующие _client
}
```

### Репозитории над Supabase

- Один репозиторий = одна доменная область (auth, transactions, profile, ...).
- Интерфейс живёт в `domain/repositories`.
- Реализация над Supabase живёт в `data/repositories`.
- Все методы возвращают `Future<Result<T>>` или `Stream<T>` (обёрнутый при необходимости).

Пример паттерна (упрощённо, следуем стилю `SupabaseAuthRepository`):

```dart
@LazySingleton(as: TransactionsRepository)
class SupabaseTransactionsRepository implements TransactionsRepository {
  const SupabaseTransactionsRepository(this._provider);

  final SupabaseClientProvider _provider;

  SupabaseClient get _client => _provider.client;

  @override
  Future<Result<List<Transaction>>> getAll() async {
    try {
      final response = await _client
          .from('transactions')
          .select()
          .order('created_at', ascending: false);

      final items = (response as List<dynamic>)
          .map((json) => Transaction.fromJson(json as Map<String, dynamic>))
          .toList();

      return Result.success(items);
    } on PostgrestException catch (e) {
      return Result.error(ServerFailure(e.message));
    } catch (_) {
      return const Result.error(ServerFailure());
    }
  }
}
```

Ключевые моменты:

- `try/catch` внутри репозитория;
- SDK‑специфичные ошибки (`AuthException`, `PostgrestException`) маппим в `Failure`;
- наружу возвращаем только доменные сущности.

---

### Кэширование

**Зачем кэш:** быстрее загрузка, возможность показать данные оффлайн, меньше запросов к Supabase.

**Где хранить:**

- для небольших настроек/флагов — `shared_preferences`;
- для списков и сложных структур — отдельное локальное хранилище (Hive / SQLite / файл);
- кэшируем **результаты репозиториев**, а не сами запросы.

### Базовый паттерн кэширования

Рекомендованный подход для данных, которые можно показывать старыми, пока грузим свежие:

```dart
class CachedTransactionsRepository implements TransactionsRepository {
  CachedTransactionsRepository(this._remote, this._local);

  final TransactionsRepository _remote; // Supabase
  final LocalTransactionsDataSource _local;

  @override
  Future<Result<List<Transaction>>> getAll() async {
    final cached = await _local.readAll();
    if (cached.isNotEmpty) {
      // 1. Сразу отдаём кэш UI
      return Result.success(cached);
    }

    // 2. Тянем данные с Supabase
    final remoteResult = await _remote.getAll();
    return remoteResult.map(
      onSuccess: (items) async {
        await _local.saveAll(items);
        return Result.success(items);
      },
      onError: Result.error,
    );
  }
}
```

Где:

- `LocalTransactionsDataSource` — обёртка над Hive/SQLite/файлом;
- UI не знает, есть ли кэш — он всегда работает через `TransactionsRepository`.

### Правила кэширования

- Не кэшируем:
  - пароли, токены (ими управляет Supabase);
  - чувствительные данные без шифрования.
- Обязательно продумываем **инвалидацию**:
  - по времени (TTL);
  - по событию (после `addTransaction` обновляем или чистим кэш).
- Не кэшируем то, что дешевле получить, чем хранить (например, простые флаги, которые уже есть в Supabase Session).

---

### Краткий чек‑лист для новой фичи с Supabase

- [ ] Есть интерфейс репозитория в `domain/repositories`.
- [ ] Есть реализация над Supabase в `data/repositories`, использующая `SupabaseClientProvider`.
- [ ] Методы репозитория возвращают `Result<DomainEntity>` / `Result<List<DomainEntity>>`.
- [ ] Вся Supabase‑логика сосредоточена в слое `data`, а не в BLoC/виджетах.
- [ ] Если данные тяжёлые или часто используются — продуман и реализован кэш‑слой.

