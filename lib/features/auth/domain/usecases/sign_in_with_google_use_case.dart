import 'package:injectable/injectable.dart';
import 'package:money_tracker/core/error/result.dart';
import 'package:money_tracker/features/auth/domain/entities/auth_entity.dart';
import 'package:money_tracker/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class SignInWithGoogleUseCase {
  const SignInWithGoogleUseCase(this._repository);

  final AuthRepository _repository;

  Future<Result<AuthEntity>> call() => _repository.signInWithGoogle();
}
