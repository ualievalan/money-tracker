class TransactionItem {
  final String id;
  final double amount;
  final String note;
  final DateTime date;

  TransactionItem({
    required this.id,
    required this.amount,
    required this.note,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'note': note,
        'date': date.toIso8601String(),
      };

  factory TransactionItem.fromJson(Map<String, dynamic> json) {
    return TransactionItem(
      id: json['id'],
      amount: (json['amount'] as num).toDouble(),
      note: json['note'],
      date: DateTime.parse(json['date']),
    );
  }
}
