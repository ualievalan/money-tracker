import 'package:injectable/injectable.dart';
import 'package:money_tracker/features/transactions/domain/entities/transaction.dart';
import 'package:money_tracker/features/transactions/domain/repositories/transactions_repository.dart';

@lazySingleton
class GetTransactionsUseCase {
  const GetTransactionsUseCase(this._repository);

  final TransactionsRepository _repository;

  Future<List<TransactionItem>> call() => _repository.getAll();
}

