import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/core/error/failure.dart';
import 'package:money_tracker/features/auth/domain/entities/auth_entity.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  /// Initial state — no auth action has been triggered yet.
  const factory AuthState.initial() = AuthInitial;

  /// An auth operation is in progress (sign in / sign up / sign out).
  const factory AuthState.loading() = AuthLoading;

  /// Auth operation succeeded. [user] is the authenticated entity.
  const factory AuthState.authenticated(AuthEntity user) = AuthAuthenticated;

  /// User has been signed out or was never authenticated.
  const factory AuthState.unauthenticated() = AuthUnauthenticated;

  /// Auth operation failed. [failure] describes what went wrong.
  const factory AuthState.failure(Failure failure) = AuthFailureState;
}
