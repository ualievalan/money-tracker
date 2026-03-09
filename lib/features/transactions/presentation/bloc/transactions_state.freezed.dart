// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionItem> items) loaded,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionItem> items)? loaded,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionItem> items)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsInitial value) initial,
    required TResult Function(TransactionsLoading value) loading,
    required TResult Function(TransactionsLoaded value) loaded,
    required TResult Function(TransactionsFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsInitial value)? initial,
    TResult? Function(TransactionsLoading value)? loading,
    TResult? Function(TransactionsLoaded value)? loaded,
    TResult? Function(TransactionsFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsInitial value)? initial,
    TResult Function(TransactionsLoading value)? loading,
    TResult Function(TransactionsLoaded value)? loaded,
    TResult Function(TransactionsFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsStateCopyWith<$Res> {
  factory $TransactionsStateCopyWith(
          TransactionsState value, $Res Function(TransactionsState) then) =
      _$TransactionsStateCopyWithImpl<$Res, TransactionsState>;
}

/// @nodoc
class _$TransactionsStateCopyWithImpl<$Res, $Val extends TransactionsState>
    implements $TransactionsStateCopyWith<$Res> {
  _$TransactionsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TransactionsInitialImplCopyWith<$Res> {
  factory _$$TransactionsInitialImplCopyWith(_$TransactionsInitialImpl value,
          $Res Function(_$TransactionsInitialImpl) then) =
      __$$TransactionsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionsInitialImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsInitialImpl>
    implements _$$TransactionsInitialImplCopyWith<$Res> {
  __$$TransactionsInitialImplCopyWithImpl(_$TransactionsInitialImpl _value,
      $Res Function(_$TransactionsInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionsInitialImpl implements TransactionsInitial {
  const _$TransactionsInitialImpl();

  @override
  String toString() {
    return 'TransactionsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionItem> items) loaded,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionItem> items)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionItem> items)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsInitial value) initial,
    required TResult Function(TransactionsLoading value) loading,
    required TResult Function(TransactionsLoaded value) loaded,
    required TResult Function(TransactionsFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsInitial value)? initial,
    TResult? Function(TransactionsLoading value)? loading,
    TResult? Function(TransactionsLoaded value)? loaded,
    TResult? Function(TransactionsFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsInitial value)? initial,
    TResult Function(TransactionsLoading value)? loading,
    TResult Function(TransactionsLoaded value)? loaded,
    TResult Function(TransactionsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TransactionsInitial implements TransactionsState {
  const factory TransactionsInitial() = _$TransactionsInitialImpl;
}

/// @nodoc
abstract class _$$TransactionsLoadingImplCopyWith<$Res> {
  factory _$$TransactionsLoadingImplCopyWith(_$TransactionsLoadingImpl value,
          $Res Function(_$TransactionsLoadingImpl) then) =
      __$$TransactionsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionsLoadingImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsLoadingImpl>
    implements _$$TransactionsLoadingImplCopyWith<$Res> {
  __$$TransactionsLoadingImplCopyWithImpl(_$TransactionsLoadingImpl _value,
      $Res Function(_$TransactionsLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionsLoadingImpl implements TransactionsLoading {
  const _$TransactionsLoadingImpl();

  @override
  String toString() {
    return 'TransactionsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionItem> items) loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionItem> items)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionItem> items)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsInitial value) initial,
    required TResult Function(TransactionsLoading value) loading,
    required TResult Function(TransactionsLoaded value) loaded,
    required TResult Function(TransactionsFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsInitial value)? initial,
    TResult? Function(TransactionsLoading value)? loading,
    TResult? Function(TransactionsLoaded value)? loaded,
    TResult? Function(TransactionsFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsInitial value)? initial,
    TResult Function(TransactionsLoading value)? loading,
    TResult Function(TransactionsLoaded value)? loaded,
    TResult Function(TransactionsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TransactionsLoading implements TransactionsState {
  const factory TransactionsLoading() = _$TransactionsLoadingImpl;
}

/// @nodoc
abstract class _$$TransactionsLoadedImplCopyWith<$Res> {
  factory _$$TransactionsLoadedImplCopyWith(_$TransactionsLoadedImpl value,
          $Res Function(_$TransactionsLoadedImpl) then) =
      __$$TransactionsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionItem> items});
}

/// @nodoc
class __$$TransactionsLoadedImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsLoadedImpl>
    implements _$$TransactionsLoadedImplCopyWith<$Res> {
  __$$TransactionsLoadedImplCopyWithImpl(_$TransactionsLoadedImpl _value,
      $Res Function(_$TransactionsLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$TransactionsLoadedImpl(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TransactionItem>,
    ));
  }
}

/// @nodoc

class _$TransactionsLoadedImpl implements TransactionsLoaded {
  const _$TransactionsLoadedImpl(final List<TransactionItem> items)
      : _items = items;

  final List<TransactionItem> _items;
  @override
  List<TransactionItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'TransactionsState.loaded(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsLoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsLoadedImplCopyWith<_$TransactionsLoadedImpl> get copyWith =>
      __$$TransactionsLoadedImplCopyWithImpl<_$TransactionsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionItem> items) loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionItem> items)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionItem> items)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsInitial value) initial,
    required TResult Function(TransactionsLoading value) loading,
    required TResult Function(TransactionsLoaded value) loaded,
    required TResult Function(TransactionsFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsInitial value)? initial,
    TResult? Function(TransactionsLoading value)? loading,
    TResult? Function(TransactionsLoaded value)? loaded,
    TResult? Function(TransactionsFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsInitial value)? initial,
    TResult Function(TransactionsLoading value)? loading,
    TResult Function(TransactionsLoaded value)? loaded,
    TResult Function(TransactionsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TransactionsLoaded implements TransactionsState {
  const factory TransactionsLoaded(final List<TransactionItem> items) =
      _$TransactionsLoadedImpl;

  List<TransactionItem> get items;
  @JsonKey(ignore: true)
  _$$TransactionsLoadedImplCopyWith<_$TransactionsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionsFailureImplCopyWith<$Res> {
  factory _$$TransactionsFailureImplCopyWith(_$TransactionsFailureImpl value,
          $Res Function(_$TransactionsFailureImpl) then) =
      __$$TransactionsFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TransactionsFailureImplCopyWithImpl<$Res>
    extends _$TransactionsStateCopyWithImpl<$Res, _$TransactionsFailureImpl>
    implements _$$TransactionsFailureImplCopyWith<$Res> {
  __$$TransactionsFailureImplCopyWithImpl(_$TransactionsFailureImpl _value,
      $Res Function(_$TransactionsFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TransactionsFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransactionsFailureImpl implements TransactionsFailure {
  const _$TransactionsFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TransactionsState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsFailureImplCopyWith<_$TransactionsFailureImpl> get copyWith =>
      __$$TransactionsFailureImplCopyWithImpl<_$TransactionsFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TransactionItem> items) loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TransactionItem> items)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TransactionItem> items)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsInitial value) initial,
    required TResult Function(TransactionsLoading value) loading,
    required TResult Function(TransactionsLoaded value) loaded,
    required TResult Function(TransactionsFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsInitial value)? initial,
    TResult? Function(TransactionsLoading value)? loading,
    TResult? Function(TransactionsLoaded value)? loaded,
    TResult? Function(TransactionsFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsInitial value)? initial,
    TResult Function(TransactionsLoading value)? loading,
    TResult Function(TransactionsLoaded value)? loaded,
    TResult Function(TransactionsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class TransactionsFailure implements TransactionsState {
  const factory TransactionsFailure(final String message) =
      _$TransactionsFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$TransactionsFailureImplCopyWith<_$TransactionsFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
