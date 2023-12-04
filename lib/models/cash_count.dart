class CashCount {
  final double amount;
  final DateTime date;

  CashCount({
    required this.amount,
    required this.date,
  });

  factory CashCount.fromJson(Map<String, dynamic> json) {
    return CashCount(
      amount: json['amount'],
      date: DateTime.parse(json['date']),
    );
  }
}
