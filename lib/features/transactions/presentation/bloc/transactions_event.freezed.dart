// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(TransactionItem transaction)
        addTransactionRequested,
    required TResult Function(TransactionItem transaction)
        updateTransactionRequested,
    required TResult Function(String id) deleteTransactionRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(TransactionItem transaction)? addTransactionRequested,
    TResult? Function(TransactionItem transaction)? updateTransactionRequested,
    TResult? Function(String id)? deleteTransactionRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(TransactionItem transaction)? addTransactionRequested,
    TResult Function(TransactionItem transaction)? updateTransactionRequested,
    TResult Function(String id)? deleteTransactionRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsLoadRequested value) loadRequested,
    required TResult Function(TransactionsAddRequested value)
        addTransactionRequested,
    required TResult Function(TransactionsUpdateRequested value)
        updateTransactionRequested,
    required TResult Function(TransactionsDeleteRequested value)
        deleteTransactionRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsLoadRequested value)? loadRequested,
    TResult? Function(TransactionsAddRequested value)? addTransactionRequested,
    TResult? Function(TransactionsUpdateRequested value)?
        updateTransactionRequested,
    TResult? Function(TransactionsDeleteRequested value)?
        deleteTransactionRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsLoadRequested value)? loadRequested,
    TResult Function(TransactionsAddRequested value)? addTransactionRequested,
    TResult Function(TransactionsUpdateRequested value)?
        updateTransactionRequested,
    TResult Function(TransactionsDeleteRequested value)?
        deleteTransactionRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsEventCopyWith<$Res> {
  factory $TransactionsEventCopyWith(
          TransactionsEvent value, $Res Function(TransactionsEvent) then) =
      _$TransactionsEventCopyWithImpl<$Res, TransactionsEvent>;
}

/// @nodoc
class _$TransactionsEventCopyWithImpl<$Res, $Val extends TransactionsEvent>
    implements $TransactionsEventCopyWith<$Res> {
  _$TransactionsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TransactionsLoadRequestedImplCopyWith<$Res> {
  factory _$$TransactionsLoadRequestedImplCopyWith(
          _$TransactionsLoadRequestedImpl value,
          $Res Function(_$TransactionsLoadRequestedImpl) then) =
      __$$TransactionsLoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionsLoadRequestedImplCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res,
        _$TransactionsLoadRequestedImpl>
    implements _$$TransactionsLoadRequestedImplCopyWith<$Res> {
  __$$TransactionsLoadRequestedImplCopyWithImpl(
      _$TransactionsLoadRequestedImpl _value,
      $Res Function(_$TransactionsLoadRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionsLoadRequestedImpl implements TransactionsLoadRequested {
  const _$TransactionsLoadRequestedImpl();

  @override
  String toString() {
    return 'TransactionsEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsLoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(TransactionItem transaction)
        addTransactionRequested,
    required TResult Function(TransactionItem transaction)
        updateTransactionRequested,
    required TResult Function(String id) deleteTransactionRequested,
  }) {
    return loadRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(TransactionItem transaction)? addTransactionRequested,
    TResult? Function(TransactionItem transaction)? updateTransactionRequested,
    TResult? Function(String id)? deleteTransactionRequested,
  }) {
    return loadRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(TransactionItem transaction)? addTransactionRequested,
    TResult Function(TransactionItem transaction)? updateTransactionRequested,
    TResult Function(String id)? deleteTransactionRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsLoadRequested value) loadRequested,
    required TResult Function(TransactionsAddRequested value)
        addTransactionRequested,
    required TResult Function(TransactionsUpdateRequested value)
        updateTransactionRequested,
    required TResult Function(TransactionsDeleteRequested value)
        deleteTransactionRequested,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsLoadRequested value)? loadRequested,
    TResult? Function(TransactionsAddRequested value)? addTransactionRequested,
    TResult? Function(TransactionsUpdateRequested value)?
        updateTransactionRequested,
    TResult? Function(TransactionsDeleteRequested value)?
        deleteTransactionRequested,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsLoadRequested value)? loadRequested,
    TResult Function(TransactionsAddRequested value)? addTransactionRequested,
    TResult Function(TransactionsUpdateRequested value)?
        updateTransactionRequested,
    TResult Function(TransactionsDeleteRequested value)?
        deleteTransactionRequested,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class TransactionsLoadRequested implements TransactionsEvent {
  const factory TransactionsLoadRequested() = _$TransactionsLoadRequestedImpl;
}

/// @nodoc
abstract class _$$TransactionsAddRequestedImplCopyWith<$Res> {
  factory _$$TransactionsAddRequestedImplCopyWith(
          _$TransactionsAddRequestedImpl value,
          $Res Function(_$TransactionsAddRequestedImpl) then) =
      __$$TransactionsAddRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionItem transaction});
}

/// @nodoc
class __$$TransactionsAddRequestedImplCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res,
        _$TransactionsAddRequestedImpl>
    implements _$$TransactionsAddRequestedImplCopyWith<$Res> {
  __$$TransactionsAddRequestedImplCopyWithImpl(
      _$TransactionsAddRequestedImpl _value,
      $Res Function(_$TransactionsAddRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$TransactionsAddRequestedImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionItem,
    ));
  }
}

/// @nodoc

class _$TransactionsAddRequestedImpl implements TransactionsAddRequested {
  const _$TransactionsAddRequestedImpl(this.transaction);

  @override
  final TransactionItem transaction;

  @override
  String toString() {
    return 'TransactionsEvent.addTransactionRequested(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsAddRequestedImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsAddRequestedImplCopyWith<_$TransactionsAddRequestedImpl>
      get copyWith => __$$TransactionsAddRequestedImplCopyWithImpl<
          _$TransactionsAddRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(TransactionItem transaction)
        addTransactionRequested,
    required TResult Function(TransactionItem transaction)
        updateTransactionRequested,
    required TResult Function(String id) deleteTransactionRequested,
  }) {
    return addTransactionRequested(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(TransactionItem transaction)? addTransactionRequested,
    TResult? Function(TransactionItem transaction)? updateTransactionRequested,
    TResult? Function(String id)? deleteTransactionRequested,
  }) {
    return addTransactionRequested?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(TransactionItem transaction)? addTransactionRequested,
    TResult Function(TransactionItem transaction)? updateTransactionRequested,
    TResult Function(String id)? deleteTransactionRequested,
    required TResult orElse(),
  }) {
    if (addTransactionRequested != null) {
      return addTransactionRequested(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsLoadRequested value) loadRequested,
    required TResult Function(TransactionsAddRequested value)
        addTransactionRequested,
    required TResult Function(TransactionsUpdateRequested value)
        updateTransactionRequested,
    required TResult Function(TransactionsDeleteRequested value)
        deleteTransactionRequested,
  }) {
    return addTransactionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsLoadRequested value)? loadRequested,
    TResult? Function(TransactionsAddRequested value)? addTransactionRequested,
    TResult? Function(TransactionsUpdateRequested value)?
        updateTransactionRequested,
    TResult? Function(TransactionsDeleteRequested value)?
        deleteTransactionRequested,
  }) {
    return addTransactionRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsLoadRequested value)? loadRequested,
    TResult Function(TransactionsAddRequested value)? addTransactionRequested,
    TResult Function(TransactionsUpdateRequested value)?
        updateTransactionRequested,
    TResult Function(TransactionsDeleteRequested value)?
        deleteTransactionRequested,
    required TResult orElse(),
  }) {
    if (addTransactionRequested != null) {
      return addTransactionRequested(this);
    }
    return orElse();
  }
}

abstract class TransactionsAddRequested implements TransactionsEvent {
  const factory TransactionsAddRequested(final TransactionItem transaction) =
      _$TransactionsAddRequestedImpl;

  TransactionItem get transaction;
  @JsonKey(ignore: true)
  _$$TransactionsAddRequestedImplCopyWith<_$TransactionsAddRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionsUpdateRequestedImplCopyWith<$Res> {
  factory _$$TransactionsUpdateRequestedImplCopyWith(
          _$TransactionsUpdateRequestedImpl value,
          $Res Function(_$TransactionsUpdateRequestedImpl) then) =
      __$$TransactionsUpdateRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionItem transaction});
}

/// @nodoc
class __$$TransactionsUpdateRequestedImplCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res,
        _$TransactionsUpdateRequestedImpl>
    implements _$$TransactionsUpdateRequestedImplCopyWith<$Res> {
  __$$TransactionsUpdateRequestedImplCopyWithImpl(
      _$TransactionsUpdateRequestedImpl _value,
      $Res Function(_$TransactionsUpdateRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$TransactionsUpdateRequestedImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionItem,
    ));
  }
}

/// @nodoc

class _$TransactionsUpdateRequestedImpl implements TransactionsUpdateRequested {
  const _$TransactionsUpdateRequestedImpl(this.transaction);

  @override
  final TransactionItem transaction;

  @override
  String toString() {
    return 'TransactionsEvent.updateTransactionRequested(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsUpdateRequestedImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsUpdateRequestedImplCopyWith<_$TransactionsUpdateRequestedImpl>
      get copyWith => __$$TransactionsUpdateRequestedImplCopyWithImpl<
          _$TransactionsUpdateRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(TransactionItem transaction)
        addTransactionRequested,
    required TResult Function(TransactionItem transaction)
        updateTransactionRequested,
    required TResult Function(String id) deleteTransactionRequested,
  }) {
    return updateTransactionRequested(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(TransactionItem transaction)? addTransactionRequested,
    TResult? Function(TransactionItem transaction)? updateTransactionRequested,
    TResult? Function(String id)? deleteTransactionRequested,
  }) {
    return updateTransactionRequested?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(TransactionItem transaction)? addTransactionRequested,
    TResult Function(TransactionItem transaction)? updateTransactionRequested,
    TResult Function(String id)? deleteTransactionRequested,
    required TResult orElse(),
  }) {
    if (updateTransactionRequested != null) {
      return updateTransactionRequested(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsLoadRequested value) loadRequested,
    required TResult Function(TransactionsAddRequested value)
        addTransactionRequested,
    required TResult Function(TransactionsUpdateRequested value)
        updateTransactionRequested,
    required TResult Function(TransactionsDeleteRequested value)
        deleteTransactionRequested,
  }) {
    return updateTransactionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsLoadRequested value)? loadRequested,
    TResult? Function(TransactionsAddRequested value)? addTransactionRequested,
    TResult? Function(TransactionsUpdateRequested value)?
        updateTransactionRequested,
    TResult? Function(TransactionsDeleteRequested value)?
        deleteTransactionRequested,
  }) {
    return updateTransactionRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsLoadRequested value)? loadRequested,
    TResult Function(TransactionsAddRequested value)? addTransactionRequested,
    TResult Function(TransactionsUpdateRequested value)?
        updateTransactionRequested,
    TResult Function(TransactionsDeleteRequested value)?
        deleteTransactionRequested,
    required TResult orElse(),
  }) {
    if (updateTransactionRequested != null) {
      return updateTransactionRequested(this);
    }
    return orElse();
  }
}

abstract class TransactionsUpdateRequested implements TransactionsEvent {
  const factory TransactionsUpdateRequested(final TransactionItem transaction) =
      _$TransactionsUpdateRequestedImpl;

  TransactionItem get transaction;
  @JsonKey(ignore: true)
  _$$TransactionsUpdateRequestedImplCopyWith<_$TransactionsUpdateRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionsDeleteRequestedImplCopyWith<$Res> {
  factory _$$TransactionsDeleteRequestedImplCopyWith(
          _$TransactionsDeleteRequestedImpl value,
          $Res Function(_$TransactionsDeleteRequestedImpl) then) =
      __$$TransactionsDeleteRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$TransactionsDeleteRequestedImplCopyWithImpl<$Res>
    extends _$TransactionsEventCopyWithImpl<$Res,
        _$TransactionsDeleteRequestedImpl>
    implements _$$TransactionsDeleteRequestedImplCopyWith<$Res> {
  __$$TransactionsDeleteRequestedImplCopyWithImpl(
      _$TransactionsDeleteRequestedImpl _value,
      $Res Function(_$TransactionsDeleteRequestedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$TransactionsDeleteRequestedImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransactionsDeleteRequestedImpl implements TransactionsDeleteRequested {
  const _$TransactionsDeleteRequestedImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'TransactionsEvent.deleteTransactionRequested(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionsDeleteRequestedImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionsDeleteRequestedImplCopyWith<_$TransactionsDeleteRequestedImpl>
      get copyWith => __$$TransactionsDeleteRequestedImplCopyWithImpl<
          _$TransactionsDeleteRequestedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function(TransactionItem transaction)
        addTransactionRequested,
    required TResult Function(TransactionItem transaction)
        updateTransactionRequested,
    required TResult Function(String id) deleteTransactionRequested,
  }) {
    return deleteTransactionRequested(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function(TransactionItem transaction)? addTransactionRequested,
    TResult? Function(TransactionItem transaction)? updateTransactionRequested,
    TResult? Function(String id)? deleteTransactionRequested,
  }) {
    return deleteTransactionRequested?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function(TransactionItem transaction)? addTransactionRequested,
    TResult Function(TransactionItem transaction)? updateTransactionRequested,
    TResult Function(String id)? deleteTransactionRequested,
    required TResult orElse(),
  }) {
    if (deleteTransactionRequested != null) {
      return deleteTransactionRequested(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TransactionsLoadRequested value) loadRequested,
    required TResult Function(TransactionsAddRequested value)
        addTransactionRequested,
    required TResult Function(TransactionsUpdateRequested value)
        updateTransactionRequested,
    required TResult Function(TransactionsDeleteRequested value)
        deleteTransactionRequested,
  }) {
    return deleteTransactionRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TransactionsLoadRequested value)? loadRequested,
    TResult? Function(TransactionsAddRequested value)? addTransactionRequested,
    TResult? Function(TransactionsUpdateRequested value)?
        updateTransactionRequested,
    TResult? Function(TransactionsDeleteRequested value)?
        deleteTransactionRequested,
  }) {
    return deleteTransactionRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TransactionsLoadRequested value)? loadRequested,
    TResult Function(TransactionsAddRequested value)? addTransactionRequested,
    TResult Function(TransactionsUpdateRequested value)?
        updateTransactionRequested,
    TResult Function(TransactionsDeleteRequested value)?
        deleteTransactionRequested,
    required TResult orElse(),
  }) {
    if (deleteTransactionRequested != null) {
      return deleteTransactionRequested(this);
    }
    return orElse();
  }
}

abstract class TransactionsDeleteRequested implements TransactionsEvent {
  const factory TransactionsDeleteRequested(final String id) =
      _$TransactionsDeleteRequestedImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$TransactionsDeleteRequestedImplCopyWith<_$TransactionsDeleteRequestedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
