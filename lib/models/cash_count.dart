class CashCount {
  final double initalAmount;
  double finalAmount = 0;
  final DateTime date;

  CashCount({
    required this.initalAmount,
    required this.date,
    this.finalAmount = 0,
  });

  void setFinalAmount(double finalAmount) {
    this.finalAmount = finalAmount;
  }

  Map<String, dynamic> toJson() {
    return {
      'initalAmount': initalAmount,
      'finalAmount': finalAmount,
      'date': date.toIso8601String(),
    };
  }

  factory CashCount.fromJson(Map<String, dynamic> json) {
    return CashCount(
      initalAmount: json['initalAmount'],
      finalAmount: json['finalAmount'],
      date: DateTime.parse(json['date']),
    );
  }
}
