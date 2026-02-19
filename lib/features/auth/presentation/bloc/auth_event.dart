import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Triggered when the user submits the sign-in form.
  const factory AuthEvent.signInRequested({
    required String email,
    required String password,
  }) = AuthSignInRequested;

  /// Triggered when the user submits the sign-up form.
  const factory AuthEvent.signUpRequested({
    required String email,
    required String password,
  }) = AuthSignUpRequested;

  /// Triggered when sign-out button is tapped.
  const factory AuthEvent.signOutRequested() = AuthSignOutRequested;

  /// Triggered on startup or whenever auth state changes externally.
  const factory AuthEvent.authStateChanged() = AuthStateChanged;
}
