import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:money_tracker/features/transactions/domain/entities/transaction.dart';
import 'package:money_tracker/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences-based implementation of [TransactionsRepository].
///
/// Keeps an in-memory cache of transactions and persists them as JSON.
@LazySingleton(as: TransactionsRepository)
class SharedPrefsTransactionsRepository implements TransactionsRepository {
  SharedPrefsTransactionsRepository();

  static const _key = 'transactions';

  final List<TransactionItem> _items = [];
  bool _isLoaded = false;

  Future<void> _ensureLoaded() async {
    if (_isLoaded) return;

    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);

    if (jsonString != null) {
      final List<dynamic> decoded = jsonDecode(jsonString) as List<dynamic>;
      _items
        ..clear()
        ..addAll(
          decoded
              .cast<Map<String, dynamic>>()
              .map(TransactionItem.fromJson),
        );
    }

    _isLoaded = true;
  }

  @override
  Future<List<TransactionItem>> getAll() async {
    await _ensureLoaded();
    return List.unmodifiable(_items);
  }

  @override
  Future<void> add(TransactionItem transaction) async {
    await _ensureLoaded();
    _items.insert(0, transaction);
    await _save();
  }

  @override
  Future<void> update(TransactionItem transaction) async {
    await _ensureLoaded();
    final index = _items.indexWhere((e) => e.id == transaction.id);
    if (index == -1) return;

    _items[index] = transaction;
    await _save();
  }

  @override
  Future<void> delete(String id) async {
    await _ensureLoaded();
    _items.removeWhere((e) => e.id == id);
    await _save();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString =
        jsonEncode(_items.map((e) => e.toJson()).toList(growable: false));
    await prefs.setString(_key, jsonString);
  }
}

