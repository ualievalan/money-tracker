import 'dart:math';
import 'package:flutter/material.dart';
import 'package:money_tracker/core/di/injection.dart';
import 'package:money_tracker/features/transactions/domain/entities/transaction.dart';
import 'package:money_tracker/features/transactions/domain/usecases/add_transaction_use_case.dart';
import 'package:money_tracker/features/transactions/domain/usecases/update_transaction_use_case.dart';

class AddExpenseScreen extends StatefulWidget {
  final TransactionItem? transaction;

  const AddExpenseScreen({super.key, this.transaction});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  late final AddTransactionUseCase _addTransaction =
      getIt<AddTransactionUseCase>();
  late final UpdateTransactionUseCase _updateTransaction =
      getIt<UpdateTransactionUseCase>();

  @override
  void initState() {
    super.initState();

    final transaction = widget.transaction;
    if (transaction != null) {
      _amountController.text = transaction.amount.toString();
      _noteController.text = transaction.note;
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final amount = double.tryParse(_amountController.text);

    if (amount == null || amount <= 0) return;

    final transaction = widget.transaction;

    if (transaction != null) {
      final updatedTransaction = TransactionItem(
        id: transaction.id,
        amount: amount,
        note: _noteController.text,
        date: transaction.date,
      );

      await _updateTransaction(updatedTransaction);
    } else {
      final newTransaction = TransactionItem(
        id: Random().nextInt(999999).toString(),
        amount: amount,
        note: _noteController.text,
        date: DateTime.now(),
      );

      await _addTransaction(newTransaction);
    }

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.transaction != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Редактировать расход' : 'Добавить расход'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Сумма'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(labelText: 'Комментарий'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _save,
                child: Text(isEditing ? 'Обновить' : 'Сохранить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
