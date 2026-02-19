import 'package:injectable/injectable.dart';
import 'package:money_tracker/core/error/failure.dart';
import 'package:money_tracker/core/error/result.dart';
import 'package:money_tracker/core/network/supabase_client_provider.dart';
import 'package:money_tracker/features/auth/domain/entities/auth_entity.dart';
import 'package:money_tracker/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase-backed implementation of [AuthRepository].
///
/// All Supabase-specific types are contained here — Domain and Presentation
/// layers never import from `supabase_flutter` directly.
@LazySingleton(as: AuthRepository)
class SupabaseAuthRepository implements AuthRepository {
  const SupabaseAuthRepository(this._provider);

  final SupabaseClientProvider _provider;

  SupabaseClient get _client => _provider.client;

  @override
  Future<Result<AuthEntity>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) {
        return const Result.error(AuthFailure('Пользователь не найден.'));
      }
      return Result.success(_mapUser(user));
    } on AuthException catch (e) {
      return Result.error(AuthFailure(e.message));
    } catch (_) {
      return const Result.error(ServerFailure());
    }
  }

  @override
  Future<Result<AuthEntity>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) {
        return const Result.error(AuthFailure('Не удалось создать аккаунт.'));
      }
      return Result.success(_mapUser(user));
    } on AuthException catch (e) {
      return Result.error(AuthFailure(e.message));
    } catch (_) {
      return const Result.error(ServerFailure());
    }
  }

  @override
  Future<Result<void>> signOut() async {
    try {
      await _client.auth.signOut();
      return const Result.success(null);
    } on AuthException catch (e) {
      return Result.error(AuthFailure(e.message));
    } catch (_) {
      return const Result.error(ServerFailure());
    }
  }

  @override
  AuthEntity? get currentUser {
    final user = _client.auth.currentUser;
    return user != null ? _mapUser(user) : null;
  }

  @override
  Stream<AuthEntity?> get authStateChanges =>
      _client.auth.onAuthStateChange.map((event) {
        final user = event.session?.user;
        return user != null ? _mapUser(user) : null;
      });

  /// Maps the Supabase [User] to a domain [AuthEntity].
  AuthEntity _mapUser(User user) =>
      AuthEntity(id: user.id, email: user.email ?? '');
}
