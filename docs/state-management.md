## Состояние: BLoC и Cubit

Цель: чтобы каждый джун понимал **когда** использовать BLoC или Cubit и как писать читаемый код состояния.

### Общие правила

- Вся логика — в `Bloc`/`Cubit` + use‑cases.  
  Виджеты **не** ходят напрямую в Supabase/репозитории.
- Состояния **иммутабельные**, описаны через Freezed (или простые классы, если очень просто).
- UI подписывается на состояние через `BlocBuilder` / `BlocListener`.

### Когда использовать BLoC

Используем `Bloc`, когда:

- есть **разные типы событий** (sign in, sign out, refresh, load more и т.д.);
- нужна **явная история событий**;
- удобно мыслить в терминах `Event → State`.

Примеры:

- `AuthBloc` — события: `AuthSignInRequested`, `AuthSignOutRequested`, `AuthStateChanged`.

Структура:

- `auth_event.dart` — enum‑подобные события через Freezed;
- `auth_state.dart` — состояния (initial, loading, authenticated, unauthenticated, failure);
- `auth_bloc.dart` — реализация `Bloc<AuthEvent, AuthState>`.

Код‑паттерн (упрощённо):

```dart
class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc(this._useCase) : super(const ExampleState.initial()) {
    on<ExampleRequested>(_onRequested);
  }

  final ExampleUseCase _useCase;

  Future<void> _onRequested(
    ExampleRequested event,
    Emitter<ExampleState> emit,
  ) async {
    emit(const ExampleState.loading());
    final result = await _useCase();
    result.map(
      onSuccess: (value) => emit(ExampleState.success(value)),
      onError: (failure) => emit(ExampleState.failure(failure)),
    );
  }
}
```

### Когда использовать Cubit

Используем `Cubit`, когда:

- есть **один источник событий** (например, просто переключение темы, simple‑формы);
- хватает методов вроде `increment()`, `toggle()`, `setFilter()` и т.п.

Пример:

```dart
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState.system());

  void setDark() => emit(const ThemeState.dark());
  void setLight() => emit(const ThemeState.light());
}
```

### Как мапить Result → State (на примере AuthBloc)

Шаблон, который используем во всех фичах:

```dart
Future<void> _onAction(
  SomeEvent event,
  Emitter<SomeState> emit,
) async {
  emit(const SomeState.loading());
  final result = await _useCase(...);
  result.map(
    onSuccess: (value) => emit(SomeState.success(value)),
    onError: (failure) => emit(SomeState.failure(failure)),
  );
}
```

Где:

- `Result` — наш `core/error/result.dart`;
- `Failure` — `core/error/failure.dart`;
- состояния описывают:
  - `initial` — при старте;
  - `loading` — во время запроса;
  - `success(...)` — когда есть данные;
  - `failure(failure)` — когда есть ошибка.

### Требования к состояниям

- Состояние должно описывать **то, что хочет знать UI**:
  - нужен ли лоадер;
  - есть ли ошибка и её текст;
  - есть ли данные.
- Не храним в состоянии сами use‑cases, репозитории, Supabase‑клиенты и т.д.
- Если в состоянии больше 4–5 полей — скорее всего, нужно либо разбить Cubit/BLoC на несколько, либо разделить экран.

### Как подключать BLoC/Cubit к экрану

Используем `BlocProvider` / `MultiBlocProvider`:

```dart
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: const _LoginView(),
    );
  }
}
```

Внутри `_LoginView`:

```dart
BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
    state.mapOrNull(
      authenticated: (_) => Navigator.of(context).pushReplacement(...),
      failure: (s) => showErrorSnackbar(s.failure.message),
    );
  },
  builder: (context, state) {
    return switch (state) {
      AuthInitial() => LoginForm(),
      AuthLoading() => const Center(child: CircularProgressIndicator()),
      AuthAuthenticated() => const SizedBox.shrink(), // экран уже переключили
      AuthUnauthenticated() => LoginForm(),
      AuthFailure(:final failure) => LoginForm(error: failure.message),
    };
  },
);
```

### Краткий чек‑лист для нового BLoC/Cubit

- [ ] Фича лежит в `features/<name>/presentation/bloc`.
- [ ] События/состояния описаны через Freezed (или явно).
- [ ] Внутри BLoC нет прямых вызовов Supabase — только use‑cases/репозитории.
- [ ] Ошибки мапятся через `Result.map` в отдельное состояние `failure`.
- [ ] Виджеты не знают, как работает бизнес‑логика — только реагируют на `state`.

