class CashCount {
  final String id;
  final double initalAmount;
  double finalAmount = 0;
  final DateTime date;

  CashCount({
    required this.id,
    required this.initalAmount,
    required this.date,
    this.finalAmount = 0,
  });

  void setFinalAmount(double finalAmount) {
    this.finalAmount = finalAmount;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'initalAmount': initalAmount,
      'finalAmount': finalAmount,
      'date': date.toIso8601String(),
    };
  }

  factory CashCount.fromJson(Map<String, dynamic> json) {
    return CashCount(
      id: json['id'],
      initalAmount: json['initalAmount'],
      finalAmount: json['finalAmount'],
      date: DateTime.parse(json['date']),
    );
  }
}
