import 'dart:math';

import 'package:flutter/material.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';
import 'package:money_tracker/features/transactions/domain/transaction.dart';
import 'package:money_tracker/features/transactions/data%20/transactions_storage.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final amount = double.tryParse(_amountController.text);

    if (amount == null || amount <= 0) return;

    final item = TransactionItem(
      id: Random().nextInt(999999).toString(),
      amount: amount,
      note: _noteController.text,
      date: DateTime.now(),
    );

    await TransactionsStorage.add(item);

    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(loc.addExpenseTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: loc.amount),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(labelText: loc.note),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _save,
                child: Text(loc.save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
