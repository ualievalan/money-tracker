import 'package:money_tracker/features/transactions/domain/entities/transaction.dart';

/// Abstract contract for working with transactions.
///
/// Presentation layer and use cases depend only on this interface.
abstract interface class TransactionsRepository {
  /// Returns all transactions in reverse-chronological order.
  Future<List<TransactionItem>> getAll();

  /// Persists a new [transaction].
  Future<void> add(TransactionItem transaction);

  /// Updates an existing [transaction] by id.
  Future<void> update(TransactionItem transaction);

  /// Deletes a transaction by [id].
  Future<void> delete(String id);
}

