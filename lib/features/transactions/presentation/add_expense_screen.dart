import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/achievements/achievements_cubit.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';
import 'package:money_tracker/features/transactions/domain/entities/transaction.dart';
import 'package:money_tracker/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:money_tracker/features/transactions/presentation/bloc/transactions_event.dart';

class AddExpenseScreen extends StatefulWidget {
  final TransactionItem? transaction;

  const AddExpenseScreen({super.key, this.transaction});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

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
    final rawText = _amountController.text.trim();
    final normalizedText = rawText.replaceAll(',', '.');
    final amount = double.tryParse(normalizedText);

    if (amount == null || amount <= 0) return;

    final transaction = widget.transaction;
    final bloc = context.read<TransactionsBloc>();

    if (transaction != null) {
      final updatedTransaction = TransactionItem(
        id: transaction.id,
        amount: amount,
        note: _noteController.text,
        date: transaction.date,
      );
      bloc.add(TransactionsEvent.updateTransactionRequested(updatedTransaction));
    } else {
      final newTransaction = TransactionItem(
        id: Random().nextInt(999999).toString(),
        amount: amount,
        note: _noteController.text,
        date: DateTime.now(),
      );
      bloc.add(TransactionsEvent.addTransactionRequested(newTransaction));
    }

    await context
        .read<AchievementsCubit>()
        .onTransactionAdded(DateTime.now());

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
