import 'package:money_tracker/core/error/result.dart';
import 'package:money_tracker/features/auth/domain/entities/auth_entity.dart';

/// Abstract contract for auth operations.
///
/// Concrete implementations (Supabase, mock) live in the Data layer.
/// BLoC and use cases depend only on this interface, never on concrete classes.
abstract interface class AuthRepository {
  /// Signs in with [email] and [password].
  Future<Result<AuthEntity>> signIn({
    required String email,
    required String password,
  });

  /// Creates a new account with [email] and [password].
  Future<Result<AuthEntity>> signUp({
    required String email,
    required String password,
  });

  /// Signs out the current user.
  Future<Result<void>> signOut();

  /// Signs in with Apple ID.
  Future<Result<AuthEntity>> signInWithApple();

  /// Signs in with Google account.
  Future<Result<AuthEntity>> signInWithGoogle();

  /// Returns the currently authenticated user, or `null` if not logged in.
  AuthEntity? get currentUser;

  /// Emits the current user on auth state changes (sign in / sign out).
  Stream<AuthEntity?> get authStateChanges;
}
