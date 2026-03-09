import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/features/transactions/domain/entities/transaction.dart';

part 'transactions_state.freezed.dart';

@freezed
sealed class TransactionsState with _$TransactionsState {
  /// Initial state before first load.
  const factory TransactionsState.initial() = TransactionsInitial;

  /// Loading transactions.
  const factory TransactionsState.loading() = TransactionsLoading;

  /// Transactions loaded successfully.
  const factory TransactionsState.loaded(List<TransactionItem> items) =
      TransactionsLoaded;

  /// Operation failed.
  const factory TransactionsState.failure(String message) = TransactionsFailure;
}
