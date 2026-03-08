import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/features/transactions/domain/entities/transaction.dart';

part 'transactions_event.freezed.dart';

@freezed
sealed class TransactionsEvent with _$TransactionsEvent {
  /// Load the list of transactions.
  const factory TransactionsEvent.loadRequested() = TransactionsLoadRequested;

  /// Add a new transaction.
  const factory TransactionsEvent.addTransactionRequested(
    TransactionItem transaction,
  ) = TransactionsAddRequested;

  /// Update an existing transaction.
  const factory TransactionsEvent.updateTransactionRequested(
    TransactionItem transaction,
  ) = TransactionsUpdateRequested;

  /// Delete a transaction by id.
  const factory TransactionsEvent.deleteTransactionRequested(String id) =
      TransactionsDeleteRequested;
}
