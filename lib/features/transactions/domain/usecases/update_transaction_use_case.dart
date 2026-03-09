import 'package:injectable/injectable.dart';
import 'package:money_tracker/features/transactions/domain/entities/transaction.dart';
import 'package:money_tracker/features/transactions/domain/repositories/transactions_repository.dart';

@lazySingleton
class UpdateTransactionUseCase {
  const UpdateTransactionUseCase(this._repository);

  final TransactionsRepository _repository;

  Future<void> call(TransactionItem transaction) =>
      _repository.update(transaction);
}
