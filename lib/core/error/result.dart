import 'package:money_tracker/core/error/failure.dart';

/// A discriminated union for operation results.
///
/// Prefer [Result.success] / [Result.error] factories over constructing
/// subclasses directly to keep call sites readable.
sealed class Result<Value> {
  const Result();

  /// Wraps a successful [value].
  const factory Result.success(Value value) = SuccessResult<Value>;

  /// Wraps an [Failure] describing what went wrong.
  const factory Result.error(Failure failure) = ErrorResult<Value>;
}

final class SuccessResult<Value> extends Result<Value> {
  const SuccessResult(this.value);

  final Value value;
}

final class ErrorResult<Value> extends Result<Value> {
  const ErrorResult(this.failure);

  final Failure failure;
}

extension ResultX<Value> on Result<Value> {
  /// Returns the wrapped value, or `null` if this is an [ErrorResult].
  Value? get value => switch (this) {
        SuccessResult(value: final v) => v,
        ErrorResult() => null,
      };

  /// Returns the [Failure], or `null` if this is a [SuccessResult].
  Failure? get failure => switch (this) {
        SuccessResult() => null,
        ErrorResult(failure: final f) => f,
      };

  /// Returns the [Failure] or [UnexpectedFailure] as fallback.
  Failure get failureOrDefault => switch (this) {
        SuccessResult() => const UnexpectedFailure(),
        ErrorResult(failure: final f) => f,
      };

  /// Exhaustive mapping — forces callers to handle both branches.
  T map<T>({
    required T Function(Value) onSuccess,
    required T Function(Failure) onError,
  }) =>
      switch (this) {
        SuccessResult(:final value) => onSuccess(value),
        ErrorResult(:final failure) => onError(failure),
      };

  /// Returns `true` if this is a [SuccessResult].
  bool get isSuccess => this is SuccessResult<Value>;

  /// Returns `true` if this is an [ErrorResult].
  bool get isError => this is ErrorResult<Value>;
}
