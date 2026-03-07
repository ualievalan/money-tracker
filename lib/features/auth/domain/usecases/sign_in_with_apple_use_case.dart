import 'package:injectable/injectable.dart';
import 'package:money_tracker/core/error/result.dart';
import 'package:money_tracker/features/auth/domain/entities/auth_entity.dart';
import 'package:money_tracker/features/auth/domain/repositories/auth_repository.dart';

/// Signs in an existing user with Apple ID.
@lazySingleton
class SignInWithAppleUseCase {
  const SignInWithAppleUseCase(this._repository);

  final AuthRepository _repository;

  Future<Result<AuthEntity>> call() => _repository.signInWithApple();
}
