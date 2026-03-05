import 'package:flutter/material.dart';
import 'package:money_tracker/features/transactions/data/transactions_storage.dart';
import 'package:money_tracker/features/transactions/presentation/add_expense_screen.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final items = TransactionsStorage.getAll();

    return Stack(
      children: [
        items.isEmpty
            ? const Center(child: Text('Здесь будет список ваших транзакций'))
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, i) {
                  final t = items[i];
                  return Dismissible(
                    key: ValueKey(t.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      color: Colors.red,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) async {
                      await TransactionsStorage.delete(t.id);
                      if (mounted) _refresh();
                    },
                    child: ListTile(
                      title: Text('${t.amount} ₸'),
                      subtitle: Text(t.note),
                      onTap: () async {
                        final updated = await Navigator.push<bool>(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddExpenseScreen(transaction: t),
                          ),
                        );
                        if (updated == true && mounted) _refresh();
                      },
                    ),
                  );
                },
              ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () async {
              final added = await Navigator.push<bool>(
                context,
                MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
              );
              if (added == true && mounted) _refresh();
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
