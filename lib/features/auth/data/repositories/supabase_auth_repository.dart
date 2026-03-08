import 'dart:convert';
import 'dart:math' as dart_math;
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:injectable/injectable.dart';
import 'package:money_tracker/core/error/failure.dart';
import 'package:money_tracker/core/error/result.dart';
import 'package:money_tracker/core/network/supabase_client_provider.dart';
import 'package:money_tracker/features/auth/domain/entities/auth_entity.dart';
import 'package:money_tracker/features/auth/domain/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  Future<Result<AuthEntity>> signInWithApple() async {
    try {
      final rawNonce = _generateNonce();
      final bytes = utf8.encode(rawNonce);
      final digest = sha256.convert(bytes);
      final hashedNonce = digest.toString();

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: hashedNonce,
      );

      final idToken = credential.identityToken;
      if (idToken == null) {
        return const Result.error(AuthFailure('Apple ID Token is null'));
      }

      final response = await _client.auth.signInWithIdToken(
        provider: OAuthProvider.apple,
        idToken: idToken,
        nonce: rawNonce,
      );

      final user = response.user;
      if (user == null) {
        return const Result.error(AuthFailure('Не удалось войти через Apple.'));
      }
      return Result.success(_mapUser(user));
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        return const Result.error(AuthFailure('Авторизация отменена пользователем'));
      }
      return Result.error(AuthFailure(e.message));
    } on AuthException catch (e) {
      return Result.error(AuthFailure(e.message));
    } catch (_) {
      return const Result.error(ServerFailure());
    }
  }

  @override
  Future<Result<AuthEntity>> signInWithGoogle() async {
    try {
      final webClientId = dotenv.env['GOOGLE_WEB_CLIENT_ID'];
      final iosClientId = dotenv.env['GOOGLE_IOS_CLIENT_ID'];

      final googleSignIn = GoogleSignIn(
        serverClientId: webClientId,
        clientId: iosClientId,
      );
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return const Result.error(AuthFailure('Авторизация отменена пользователем.'));
      }

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        return const Result.error(AuthFailure('Google ID Token is null'));
      }

      final response = await _client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      final user = response.user;
      if (user == null) {
        return const Result.error(AuthFailure('Не удалось войти через Google.'));
      }
      return Result.success(_mapUser(user));
    } on AuthException catch (e) {
      return Result.error(AuthFailure(e.message));
    } catch (_) {
      return const Result.error(ServerFailure());
    }
  }

  /// Вспомогательная функция для генерации nonce
  String _generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = dart_math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
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

  AuthEntity _mapUser(User user) =>
      AuthEntity(id: user.id, email: user.email ?? '');
}
