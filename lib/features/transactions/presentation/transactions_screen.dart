import 'package:flutter/material.dart';
import 'package:money_tracker/features/transactions/data%20/transactions_storage.dart';
import 'package:money_tracker/features/transactions/presentation/add_expense_screen.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = TransactionsStorage.getAll();

    return Stack(
      children: [
        items.isEmpty
            ? const Center(
                child: Text('Здесь будет список ваших транзакций'),
              )
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, i) {
                  final t = items[i];
                  return ListTile(
                    title: Text('${t.amount} ₸'),
                    subtitle: Text(t.note),
                    trailing: Text('${t.date.day}.${t.date.month}'),
                  );
                },
              ),
        // Плавающая кнопка добавления расхода, если нужна
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
