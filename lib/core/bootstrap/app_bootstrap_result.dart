import 'package:money_tracker/core/error/failure.dart';

sealed class AppBootstrapResult {
  const AppBootstrapResult();
}

final class AppBootstrapSuccess extends AppBootstrapResult {
  const AppBootstrapSuccess();
}

final class AppBootstrapFailure extends AppBootstrapResult {
  const AppBootstrapFailure(this.failure);

  final Failure failure;
}
