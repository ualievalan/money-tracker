import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:money_tracker/features/transactions/domain/usecases/add_transaction_use_case.dart';
import 'package:money_tracker/features/transactions/domain/usecases/delete_transaction_use_case.dart';
import 'package:money_tracker/features/transactions/domain/usecases/get_transactions_use_case.dart';
import 'package:money_tracker/features/transactions/domain/usecases/update_transaction_use_case.dart';
import 'package:money_tracker/features/transactions/presentation/bloc/transactions_event.dart';
import 'package:money_tracker/features/transactions/presentation/bloc/transactions_state.dart';

@injectable
class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc(
    this._getTransactions,
    this._addTransaction,
    this._updateTransaction,
    this._deleteTransaction,
  ) : super(const TransactionsState.initial()) {
    on<TransactionsLoadRequested>(_onLoadRequested);
    on<TransactionsAddRequested>(_onAddRequested);
    on<TransactionsUpdateRequested>(_onUpdateRequested);
    on<TransactionsDeleteRequested>(_onDeleteRequested);
  }

  final GetTransactionsUseCase _getTransactions;
  final AddTransactionUseCase _addTransaction;
  final UpdateTransactionUseCase _updateTransaction;
  final DeleteTransactionUseCase _deleteTransaction;

  Future<void> _onLoadRequested(
    TransactionsLoadRequested event,
    Emitter<TransactionsState> emit,
  ) async {
    emit(const TransactionsState.loading());
    try {
      final items = await _getTransactions();
      emit(TransactionsState.loaded(items));
    } catch (e) {
      emit(TransactionsState.failure('Не удалось загрузить транзакции'));
    }
  }

  Future<void> _onAddRequested(
    TransactionsAddRequested event,
    Emitter<TransactionsState> emit,
  ) async {
    try {
      await _addTransaction(event.transaction);
      final items = await _getTransactions();
      emit(TransactionsState.loaded(items));
    } catch (e) {
      emit(TransactionsState.failure('Не удалось добавить транзакцию'));
    }
  }

  Future<void> _onUpdateRequested(
    TransactionsUpdateRequested event,
    Emitter<TransactionsState> emit,
  ) async {
    try {
      await _updateTransaction(event.transaction);
      final items = await _getTransactions();
      emit(TransactionsState.loaded(items));
    } catch (e) {
      emit(TransactionsState.failure('Не удалось обновить транзакцию'));
    }
  }

  Future<void> _onDeleteRequested(
    TransactionsDeleteRequested event,
    Emitter<TransactionsState> emit,
  ) async {
    try {
      await _deleteTransaction(event.id);
      final items = await _getTransactions();
      emit(TransactionsState.loaded(items));
    } catch (e) {
      emit(TransactionsState.failure('Не удалось удалить транзакцию'));
    }
  }
}
