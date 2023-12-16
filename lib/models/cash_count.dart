class CashCount {
  final String id;
  final double initalAmount;
  double finalAmount = 0;
  final DateTime date;
  final int? cash10;
  final int? cash20;
  final int? cash50;
  final int? cash100;
  final int? cash200;
  final int? money5;
  final int? money2;
  final int? money1;
  final int? money05;
  double? backCash;
  double? backMoney;

  CashCount({
    required this.id,
    required this.initalAmount,
    required this.date,
    this.finalAmount = 0,
    this.cash10,
    this.cash20,
    this.cash50,
    this.cash100,
    this.cash200,
    this.money5,
    this.money2,
    this.money1,
    this.money05,
    this.backCash,
    this.backMoney,
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
      'cash10': cash10,
      'cash20': cash20,
      'cash50': cash50,
      'cash100': cash100,
      'cash200': cash200,
      'money5': money5,
      'money2': money2,
      'money1': money1,
      'money05': money05,
      'backCash': backCash,
      'backMoney': backMoney,
    };
  }

  factory CashCount.fromJson(Map<String, dynamic> json) {
    return CashCount(
      id: json['id'],
      initalAmount: json['initalAmount'],
      finalAmount: json['finalAmount'],
      date: DateTime.parse(json['date']),
      cash10: json['cash10'],
      cash20: json['cash20'],
      cash50: json['cash50'],
      cash100: json['cash100'],
      cash200: json['cash200'],
      money5: json['money5'],
      money2: json['money2'],
      money1: json['money1'],
      money05: json['money05'],
      backCash: json['backCash'],
      backMoney: json['backMoney'],
    );
  }
}
