/// Base sealed class for all application failures.
///
/// Every concrete failure type carries a [message] describing what went wrong,
/// which is safe to show in the UI or logs (no sensitive data).
sealed class Failure {
  const Failure(this.message);

  final String message;
}

/// Returned when the Supabase / remote API returns an error response.
final class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Произошла ошибка сервера.']);
}

/// Returned when the device has no internet connection.
final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Нет подключения к интернету.']);
}

/// Returned for Supabase AuthException and related auth errors.
final class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Ошибка аутентификации.']);
}

/// Returned when local cache read/write fails.
final class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Ошибка локального кэша.']);
}

/// Returned when required local app configuration is missing or invalid.
final class ConfigurationFailure extends Failure {
  const ConfigurationFailure([
    super.message = 'Application configuration is invalid.',
  ]);
}

/// Fallback — should never appear in production. Indicates a programming error.
final class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'Неожиданная ошибка.']);
}
