import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/core/localization/app_localizations.dart';
import 'package:money_tracker/features/transactions/domain/entities/transaction.dart';
import 'package:money_tracker/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:money_tracker/features/transactions/presentation/bloc/transactions_event.dart';
import 'package:money_tracker/features/transactions/presentation/bloc/transactions_state.dart';
import 'package:money_tracker/features/transactions/presentation/transaction_sheet.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TransactionsBloc>().add(const TransactionsEvent.loadRequested());
  }

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
      context.read<TransactionsBloc>().add(const TransactionsEvent.loadRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        return switch (state) {
          TransactionsInitial() || TransactionsLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          TransactionsFailure(message: final message) => Center(
              child: Text(message),
            ),
          TransactionsLoaded(items: final items) => Stack(
              children: [
                items.isEmpty
                    ? Center(
                        child: Text(loc.transactionsEmpty),
                      )
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
                            onDismissed: (_) {
                              context.read<TransactionsBloc>().add(
                                    TransactionsEvent.deleteTransactionRequested(t.id),
                                  );
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
            ),
        };
      },
    );
  }
}
