import 'package:money_tracker/features/transactions/domain/entities/transaction.dart';

abstract interface class TransactionsRepository {
  Future<List<TransactionItem>> getAll();
  Future<void> add(TransactionItem transaction);
  Future<void> update(TransactionItem transaction);
  Future<void> delete(String id);
}
