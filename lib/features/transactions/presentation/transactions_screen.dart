import 'package:flutter/material.dart';
import 'package:money_tracker/core/di/injection.dart';
import 'package:money_tracker/features/transactions/domain/entities/transaction.dart';
import 'package:money_tracker/features/transactions/domain/usecases/delete_transaction_use_case.dart';
import 'package:money_tracker/features/transactions/domain/usecases/get_transactions_use_case.dart';
import 'package:money_tracker/features/transactions/presentation/transaction_sheet.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  late final GetTransactionsUseCase _getTransactions =
      getIt<GetTransactionsUseCase>();
  late final DeleteTransactionUseCase _deleteTransaction =
      getIt<DeleteTransactionUseCase>();

  var _items = <TransactionItem>[];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final items = await _getTransactions();
      if (!mounted) return;
      setState(() {
        _items = items;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _error = 'Не удалось загрузить транзакции';
      });
    }
  }

  Future<void> _refresh() => _load();

  Future<void> _openTransactionSheet({TransactionItem? transaction}) async {
    final updated = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
          ),
          child: TransactionSheet(transaction: transaction),
        );
      },
    );

    if (updated == true && mounted) {
      _refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: Text(_error!));
    }

    return Stack(
      children: [
        _items.isEmpty
            ? const Center(child: Text('Здесь будет список ваших транзакций'))
            : ListView.builder(
                itemCount: _items.length,
                itemBuilder: (_, i) {
                  final t = _items[i];
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
                      await _deleteTransaction(t.id);
                      if (mounted) {
                        await _refresh();
                      }
                    },
                    child: ListTile(
                      title: Text('${t.amount} ₸'),
                      subtitle: Text(t.note),
                      onTap: () => _openTransactionSheet(transaction: t),
                    ),
                  );
                },
              ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () => _openTransactionSheet(),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
