import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/features/transactions/domain/entities/transaction.dart';
import 'package:money_tracker/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:money_tracker/features/transactions/presentation/bloc/transactions_event.dart';

class TransactionSheet extends StatefulWidget {
  const TransactionSheet({super.key, this.transaction});

  final TransactionItem? transaction;

  @override
  State<TransactionSheet> createState() => _TransactionSheetState();
}

class _TransactionSheetState extends State<TransactionSheet> {
  late final TextEditingController _amountController;
  late final TextEditingController _noteController;

  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    final transaction = widget.transaction;
    _amountController = TextEditingController(
      text: transaction != null ? transaction.amount.toString() : '',
    );
    _noteController = TextEditingController(
      text: transaction?.note ?? '',
    );
    _selectedDate = transaction?.date ?? DateTime.now();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _save() {
    final rawText = _amountController.text.trim();
    final digitsOnly = rawText.replaceAll(RegExp(r'[^0-9,\\.]'), '');
    final normalizedText = digitsOnly.replaceAll(',', '.');
    final amount = double.tryParse(normalizedText);

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите сумму больше 0')),
      );
      return;
    }

    final existing = widget.transaction;
    final bloc = context.read<TransactionsBloc>();

    if (existing != null) {
      final updated = TransactionItem(
        id: existing.id,
        amount: amount,
        note: _noteController.text,
        date: _selectedDate,
      );
      bloc.add(TransactionsEvent.updateTransactionRequested(updated));
    } else {
      final created = TransactionItem(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        amount: amount,
        note: _noteController.text,
        date: _selectedDate,
      );
      bloc.add(TransactionsEvent.addTransactionRequested(created));
    }

    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.transaction != null;
    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: theme.disabledColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Text(
            isEditing ? 'Редактировать транзакцию' : 'Новая транзакция',
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _amountController,
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium,
            decoration: const InputDecoration(
              hintText: '0',
              border: InputBorder.none,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: _selectedDate,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (picked != null) {
                setState(() {
                  _selectedDate = picked;
                });
              }
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    DateFormat('EEE, d MMMM', 'ru').format(_selectedDate),
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _noteController,
            decoration: const InputDecoration(
              labelText: 'Комментарий',
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _save,
              child: Text(isEditing ? 'Обновить' : 'Сохранить'),
            ),
          ),
        ],
      ),
    );
  }
}
