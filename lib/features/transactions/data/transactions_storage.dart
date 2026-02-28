import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:money_tracker/features/transactions/domain/transaction.dart';

class TransactionsStorage {
  static const _key = 'transactions';
  static final List<TransactionItem> _items = [];

  static List<TransactionItem> getAll() {
    return List.unmodifiable(_items);
  }

  static Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);

    if (jsonString == null) return;

    final List decoded = jsonDecode(jsonString);
    _items.clear();
    _items.addAll(decoded.map((e) => TransactionItem.fromJson(e)));
  }

  static Future<void> add(TransactionItem item) async {
    _items.insert(0, item);
    await _save();
  }

  static Future<void> update(TransactionItem updated) async {
    final index = _items.indexWhere((e) => e.id == updated.id);

    if (index != -1) {
      _items[index] = updated;
      await _save();
    }
  }

  static Future<void> delete(String id) async {
    _items.removeWhere((e) => e.id == id);
    await _save();
  }

  static Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(_items.map((e) => e.toJson()).toList());
    await prefs.setString(_key, jsonString);
  }
}
