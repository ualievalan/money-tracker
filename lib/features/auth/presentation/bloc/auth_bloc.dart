import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:money_tracker/core/error/result.dart';
import 'package:money_tracker/features/auth/domain/repositories/auth_repository.dart';
import 'package:money_tracker/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:money_tracker/features/auth/domain/usecases/sign_out_use_case.dart';
import 'package:money_tracker/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:money_tracker/features/auth/domain/usecases/sign_in_with_apple_use_case.dart';
import 'package:money_tracker/features/auth/domain/usecases/sign_in_with_google_use_case.dart';
import 'package:money_tracker/features/auth/presentation/bloc/auth_event.dart';
import 'package:money_tracker/features/auth/presentation/bloc/auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._signIn,
    this._signUp,
    this._signOut,
    this._signInWithApple,
    this._signInWithGoogle,
    this._repository,
  ) : super(const AuthState.initial()) {
    on<AuthSignInRequested>(_onSignIn);
    on<AuthSignUpRequested>(_onSignUp);
    on<AuthSignOutRequested>(_onSignOut);
    on<AuthSignInWithAppleRequested>(_onSignInWithApple);
    on<AuthSignInWithGoogleRequested>(_onSignInWithGoogle);
    on<AuthStateChanged>(_onAuthStateChanged);

    // Immediately reflect the current auth state on BLoC creation.
    _authSub = _repository.authStateChanges.listen(
      (user) => add(const AuthEvent.authStateChanged()),
    );
  }

  final SignInUseCase _signIn;
  final SignUpUseCase _signUp;
  final SignOutUseCase _signOut;
  final SignInWithAppleUseCase _signInWithApple;
  final SignInWithGoogleUseCase _signInWithGoogle;
  final AuthRepository _repository;
  late final StreamSubscription<dynamic> _authSub;

  Future<void> _onSignIn(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _signIn(email: event.email, password: event.password);
    result.map(
      onSuccess: (user) => emit(AuthState.authenticated(user)),
      onError: (failure) => emit(AuthState.failure(failure)),
    );
  }

  Future<void> _onSignUp(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _signUp(email: event.email, password: event.password);
    result.map(
      onSuccess: (user) => emit(AuthState.authenticated(user)),
      onError: (failure) => emit(AuthState.failure(failure)),
    );
  }

  Future<void> _onSignInWithApple(
    AuthSignInWithAppleRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _signInWithApple();
    result.map(
      onSuccess: (user) => emit(AuthState.authenticated(user)),
      onError: (failure) => emit(AuthState.failure(failure)),
    );
  }

  Future<void> _onSignInWithGoogle(
    AuthSignInWithGoogleRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _signInWithGoogle();
    result.map(
      onSuccess: (user) => emit(AuthState.authenticated(user)),
      onError: (failure) => emit(AuthState.failure(failure)),
    );
  }

  Future<void> _onSignOut(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _signOut();
    result.map(
      onSuccess: (_) => emit(const AuthState.unauthenticated()),
      onError: (failure) => emit(AuthState.failure(failure)),
    );
  }

  void _onAuthStateChanged(AuthStateChanged event, Emitter<AuthState> emit) {
    final user = _repository.currentUser;
    if (user != null) {
      emit(AuthState.authenticated(user));
    } else {
      emit(const AuthState.unauthenticated());
    }
  }

  @override
  Future<void> close() {
    _authSub.cancel();
    return super.close();
  }
}
