import 'package:injectable/injectable.dart';
import 'package:money_tracker/features/transactions/domain/repositories/transactions_repository.dart';

@lazySingleton
class DeleteTransactionUseCase {
  const DeleteTransactionUseCase(this._repository);

  final TransactionsRepository _repository;

  Future<void> call(String id) => _repository.delete(id);
}
