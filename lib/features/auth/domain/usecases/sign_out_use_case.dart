import 'package:injectable/injectable.dart';
import 'package:money_tracker/core/error/result.dart';
import 'package:money_tracker/features/auth/domain/repositories/auth_repository.dart';

/// Signs out the currently authenticated user.
@lazySingleton
class SignOutUseCase {
  const SignOutUseCase(this._repository);

  final AuthRepository _repository;

  Future<Result<void>> call() => _repository.signOut();
}
