import 'package:injectable/injectable.dart';
import 'package:money_tracker/core/error/result.dart';
import 'package:money_tracker/features/auth/domain/entities/auth_entity.dart';
import 'package:money_tracker/features/auth/domain/repositories/auth_repository.dart';

/// Registers a new user with email and password.
@lazySingleton
class SignUpUseCase {
  const SignUpUseCase(this._repository);

  final AuthRepository _repository;

  Future<Result<AuthEntity>> call({
    required String email,
    required String password,
  }) =>
      _repository.signUp(email: email, password: password);
}
