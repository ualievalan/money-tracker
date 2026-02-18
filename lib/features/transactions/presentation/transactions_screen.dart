import 'package:flutter/material.dart';
import 'package:money_tracker/features/transactions/data%20/transactions_storage.dart';
import 'package:money_tracker/features/transactions/presentation/add_expense_screen.dart';
class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}
class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    final items = TransactionsStorage.getAll();
    return Scaffold(
      appBar: AppBar(title: const Text('Транзакции')),
      body: items.isEmpty
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

      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
          final created =  Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
          );

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
