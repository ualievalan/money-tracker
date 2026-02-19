// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() authStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? authStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInRequested value) signInRequested,
    required TResult Function(AuthSignUpRequested value) signUpRequested,
    required TResult Function(AuthSignOutRequested value) signOutRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthSignInRequested value)? signInRequested,
    TResult? Function(AuthSignUpRequested value)? signUpRequested,
    TResult? Function(AuthSignOutRequested value)? signOutRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInRequested value)? signInRequested,
    TResult Function(AuthSignUpRequested value)? signUpRequested,
    TResult Function(AuthSignOutRequested value)? signOutRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthSignInRequestedImplCopyWith<$Res> {
  factory _$$AuthSignInRequestedImplCopyWith(_$AuthSignInRequestedImpl value,
          $Res Function(_$AuthSignInRequestedImpl) then) =
      __$$AuthSignInRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$AuthSignInRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSignInRequestedImpl>
    implements _$$AuthSignInRequestedImplCopyWith<$Res> {
  __$$AuthSignInRequestedImplCopyWithImpl(_$AuthSignInRequestedImpl _value,
      $Res Function(_$AuthSignInRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$AuthSignInRequestedImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSignInRequestedImpl implements AuthSignInRequested {
  const _$AuthSignInRequestedImpl(
      {required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signInRequested(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignInRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSignInRequestedImplCopyWith<_$AuthSignInRequestedImpl> get copyWith =>
      __$$AuthSignInRequestedImplCopyWithImpl<_$AuthSignInRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() authStateChanged,
  }) {
    return signInRequested(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? authStateChanged,
  }) {
    return signInRequested?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInRequested value) signInRequested,
    required TResult Function(AuthSignUpRequested value) signUpRequested,
    required TResult Function(AuthSignOutRequested value) signOutRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) {
    return signInRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthSignInRequested value)? signInRequested,
    TResult? Function(AuthSignUpRequested value)? signUpRequested,
    TResult? Function(AuthSignOutRequested value)? signOutRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) {
    return signInRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInRequested value)? signInRequested,
    TResult Function(AuthSignUpRequested value)? signUpRequested,
    TResult Function(AuthSignOutRequested value)? signOutRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInRequested != null) {
      return signInRequested(this);
    }
    return orElse();
  }
}

abstract class AuthSignInRequested implements AuthEvent {
  const factory AuthSignInRequested(
      {required final String email,
      required final String password}) = _$AuthSignInRequestedImpl;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$AuthSignInRequestedImplCopyWith<_$AuthSignInRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSignUpRequestedImplCopyWith<$Res> {
  factory _$$AuthSignUpRequestedImplCopyWith(_$AuthSignUpRequestedImpl value,
          $Res Function(_$AuthSignUpRequestedImpl) then) =
      __$$AuthSignUpRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$AuthSignUpRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSignUpRequestedImpl>
    implements _$$AuthSignUpRequestedImplCopyWith<$Res> {
  __$$AuthSignUpRequestedImplCopyWithImpl(_$AuthSignUpRequestedImpl _value,
      $Res Function(_$AuthSignUpRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$AuthSignUpRequestedImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthSignUpRequestedImpl implements AuthSignUpRequested {
  const _$AuthSignUpRequestedImpl(
      {required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signUpRequested(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignUpRequestedImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSignUpRequestedImplCopyWith<_$AuthSignUpRequestedImpl> get copyWith =>
      __$$AuthSignUpRequestedImplCopyWithImpl<_$AuthSignUpRequestedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() authStateChanged,
  }) {
    return signUpRequested(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? authStateChanged,
  }) {
    return signUpRequested?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) {
    if (signUpRequested != null) {
      return signUpRequested(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInRequested value) signInRequested,
    required TResult Function(AuthSignUpRequested value) signUpRequested,
    required TResult Function(AuthSignOutRequested value) signOutRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) {
    return signUpRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthSignInRequested value)? signInRequested,
    TResult? Function(AuthSignUpRequested value)? signUpRequested,
    TResult? Function(AuthSignOutRequested value)? signOutRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) {
    return signUpRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInRequested value)? signInRequested,
    TResult Function(AuthSignUpRequested value)? signUpRequested,
    TResult Function(AuthSignOutRequested value)? signOutRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signUpRequested != null) {
      return signUpRequested(this);
    }
    return orElse();
  }
}

abstract class AuthSignUpRequested implements AuthEvent {
  const factory AuthSignUpRequested(
      {required final String email,
      required final String password}) = _$AuthSignUpRequestedImpl;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$AuthSignUpRequestedImplCopyWith<_$AuthSignUpRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSignOutRequestedImplCopyWith<$Res> {
  factory _$$AuthSignOutRequestedImplCopyWith(_$AuthSignOutRequestedImpl value,
          $Res Function(_$AuthSignOutRequestedImpl) then) =
      __$$AuthSignOutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSignOutRequestedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthSignOutRequestedImpl>
    implements _$$AuthSignOutRequestedImplCopyWith<$Res> {
  __$$AuthSignOutRequestedImplCopyWithImpl(_$AuthSignOutRequestedImpl _value,
      $Res Function(_$AuthSignOutRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthSignOutRequestedImpl implements AuthSignOutRequested {
  const _$AuthSignOutRequestedImpl();

  @override
  String toString() {
    return 'AuthEvent.signOutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSignOutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() authStateChanged,
  }) {
    return signOutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? authStateChanged,
  }) {
    return signOutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInRequested value) signInRequested,
    required TResult Function(AuthSignUpRequested value) signUpRequested,
    required TResult Function(AuthSignOutRequested value) signOutRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) {
    return signOutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthSignInRequested value)? signInRequested,
    TResult? Function(AuthSignUpRequested value)? signUpRequested,
    TResult? Function(AuthSignOutRequested value)? signOutRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) {
    return signOutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInRequested value)? signInRequested,
    TResult Function(AuthSignUpRequested value)? signUpRequested,
    TResult Function(AuthSignOutRequested value)? signOutRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signOutRequested != null) {
      return signOutRequested(this);
    }
    return orElse();
  }
}

abstract class AuthSignOutRequested implements AuthEvent {
  const factory AuthSignOutRequested() = _$AuthSignOutRequestedImpl;
}

/// @nodoc
abstract class _$$AuthStateChangedImplCopyWith<$Res> {
  factory _$$AuthStateChangedImplCopyWith(_$AuthStateChangedImpl value,
          $Res Function(_$AuthStateChangedImpl) then) =
      __$$AuthStateChangedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateChangedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthStateChangedImpl>
    implements _$$AuthStateChangedImplCopyWith<$Res> {
  __$$AuthStateChangedImplCopyWithImpl(_$AuthStateChangedImpl _value,
      $Res Function(_$AuthStateChangedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthStateChangedImpl implements AuthStateChanged {
  const _$AuthStateChangedImpl();

  @override
  String toString() {
    return 'AuthEvent.authStateChanged()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateChangedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInRequested,
    required TResult Function(String email, String password) signUpRequested,
    required TResult Function() signOutRequested,
    required TResult Function() authStateChanged,
  }) {
    return authStateChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInRequested,
    TResult? Function(String email, String password)? signUpRequested,
    TResult? Function()? signOutRequested,
    TResult? Function()? authStateChanged,
  }) {
    return authStateChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInRequested,
    TResult Function(String email, String password)? signUpRequested,
    TResult Function()? signOutRequested,
    TResult Function()? authStateChanged,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthSignInRequested value) signInRequested,
    required TResult Function(AuthSignUpRequested value) signUpRequested,
    required TResult Function(AuthSignOutRequested value) signOutRequested,
    required TResult Function(AuthStateChanged value) authStateChanged,
  }) {
    return authStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthSignInRequested value)? signInRequested,
    TResult? Function(AuthSignUpRequested value)? signUpRequested,
    TResult? Function(AuthSignOutRequested value)? signOutRequested,
    TResult? Function(AuthStateChanged value)? authStateChanged,
  }) {
    return authStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthSignInRequested value)? signInRequested,
    TResult Function(AuthSignUpRequested value)? signUpRequested,
    TResult Function(AuthSignOutRequested value)? signOutRequested,
    TResult Function(AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged(this);
    }
    return orElse();
  }
}

abstract class AuthStateChanged implements AuthEvent {
  const factory AuthStateChanged() = _$AuthStateChangedImpl;
}
