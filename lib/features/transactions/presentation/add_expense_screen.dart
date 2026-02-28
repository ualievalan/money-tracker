import 'dart:math';
import 'package:flutter/material.dart';
import 'package:money_tracker/features/transactions/domain/transaction.dart';
import 'package:money_tracker/features/transactions/data/transactions_storage.dart';

class AddExpenseScreen extends StatefulWidget {
  final TransactionItem? existing;
  const AddExpenseScreen({super.key, this.existing});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existing != null) {
      _amountController.text = widget.existing!.amount.toString();
      _noteController.text = widget.existing!.note;
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

    if (widget.existing != null) {
      final updated = TransactionItem(
        id: widget.existing!.id,
        amount: amount,
        note: _noteController.text,
        date: widget.existing!.date,
      );
      await TransactionsStorage.update(updated);
    } else {
      final item = TransactionItem(
        id: Random().nextInt(999999).toString(),
        amount: amount,
        note: _noteController.text,
        date: DateTime.now(),
      );
      await TransactionsStorage.add(item);
    }

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existing != null;
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
                child: const Text('Сохранить'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
