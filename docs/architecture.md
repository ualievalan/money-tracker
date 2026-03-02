## Архитектура проекта

Цель: каждый новый экран/фича должна выглядеть **так же аккуратно**, как `lib/features/auth`.

Мы используем упрощённую **Clean Architecture** + **feature‑based** структуру.

### Структура каталогов

- `lib/core` — общие для всего приложения вещи:
  - `error` — `Failure`, `Result` и т.п.;
  - `network` — `SupabaseClientProvider` и остальное сетевое;
  - `di` — DI через `get_it` + `injectable`;
  - `theme`, `widgets`, и т.д.
- `lib/features/<feature_name>` — отдельная фича (auth, home, transactions, ...):
  - `data` — работа с сетью/кэшем, DTO, репозитории;
  - `domain` — сущности, use‑cases, абстрактные репозитории;
  - `presentation` — экраны, `Bloc`/`Cubit`, виджеты.

Пример для `auth`:

- `features/auth/data/repositories/supabase_auth_repository.dart`
- `features/auth/domain/entities/auth_entity.dart`
- `features/auth/domain/usecases/sign_in_use_case.dart`
- `features/auth/presentation/bloc/auth_bloc.dart`
- `features/auth/presentation/screen/login_screen.dart`

### Принципы по слоям

#### Domain

- **Не знает** про Flutter, Supabase, Dio и т.п.
- Содержит:
  - `entities` — чистые модели домена (например, `AuthEntity`);
  - `usecases` — отдельные классы с одной ответственной операцией (`SignInUseCase`);
  - `repositories` — **абстракции** (`abstract class AuthRepository`).
- Возвращает `Result<...>` или сущности, но не `Response`, `SupabaseUser` и т.п.

#### Data

- Знает про конкретные SDK и API (Supabase, HTTP, кэш и т.д.).
- Реализует интерфейсы из `domain/repositories`.
- Преобразует внешние типы → доменные (`User` → `AuthEntity`).
- Здесь оборачиваем ошибки в `Failure` и `Result`.

Пример: `SupabaseAuthRepository` реализует `AuthRepository` и внутри использует `SupabaseClient`.

#### Presentation

- Flutter + state management (`Bloc`/`Cubit`).
- Не знает про Supabase напрямую — общается с `usecase` / `repository` через абстракции.
- Любой `Bloc`:
  - получает `usecase`/`repository` через DI (`@injectable`);
  - хранит только состояние, нужное UI (loading, ошибка, данные);
  - не содержит прямых вызовов Supabase/HTTP.

Пример: `AuthBloc`:

- принимает `SignInUseCase`, `SignUpUseCase`, `SignOutUseCase`, `AuthRepository`;
- по событию `AuthSignInRequested`:
  - вызывает `SignInUseCase`,
  - мапит `Result` в `AuthState` (loading → success/failure).

### Как добавлять новую фичу

Допустим, нужно сделать фичу `transactions`.

1. **Создать структуру папок**:

   ```text
   lib/features/transactions/
     data/
       datasources/
       repositories/
     domain/
       entities/
       repositories/
       usecases/
     presentation/
       bloc/
       screens/
       widgets/
   ```

2. **Domain**:
   - `entities/transaction.dart` — доменная модель.
   - `repositories/transactions_repository.dart` — абстрактный репозиторий.
   - `usecases/` — отдельные use‑cases: `GetTransactions`, `AddTransaction`, и т.д.

3. **Data**:
   - реализация `TransactionsRepository` (например, `SupabaseTransactionsRepository`);
   - маппинг JSON/ответов в `Transaction`.

4. **Presentation**:
   - `TransactionsBloc` или `TransactionsCubit` (в зависимости от сложности);
   - экраны `TransactionsScreen`, `AddTransactionScreen`.

### Где и как регистрировать зависимости

- В `core/di/injection.dart` мы подключаем `injectable`:
  - все классы, помеченные `@injectable`, `@LazySingleton(as: ...)` и т.п., регистрируются автоматически.
- Для новой фичи:
  - интерфейсы (`abstract class`) остаются без аннотаций;
  - реализации в `data/` получают аннотации:

    ```dart
    @LazySingleton(as: TransactionsRepository)
    class SupabaseTransactionsRepository implements TransactionsRepository { ... }
    ```

После добавления аннотированного класса — не забываем прогнать генерацию:

```bash
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

### Когда создавать новую фичу

- Если у экрана/набора экранов есть **отдельная бизнес‑цель** (auth, profile, transactions, analytics) — это новая фича.
- Если это просто небольшой UI‑компонент, который переиспользуется в разных местах — лучше в `core/widgets` или `widgets/`.

