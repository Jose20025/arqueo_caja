class CashCount {
  double amount;
  final int? cash10;
  final int? cash20;
  final int? cash50;
  final int? cash100;
  final int? cash200;
  final int? money5;
  final int? money2;
  final int? money1;
  final int? money05;
  double? bruteCash;

  CashCount({
    required this.amount,
    this.cash10,
    this.cash20,
    this.cash50,
    this.cash100,
    this.cash200,
    this.money5,
    this.money2,
    this.money1,
    this.money05,
    this.bruteCash,
  });

  void setAmount(double amount) {
    this.amount = amount;
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'cash10': cash10,
      'cash20': cash20,
      'cash50': cash50,
      'cash100': cash100,
      'cash200': cash200,
      'money5': money5,
      'money2': money2,
      'money1': money1,
      'money05': money05,
      'bruteCash': bruteCash,
    };
  }

  factory CashCount.fromJson(Map<String, dynamic> json) {
    return CashCount(
      amount: json['amount'],
      cash10: json['cash10'],
      cash20: json['cash20'],
      cash50: json['cash50'],
      cash100: json['cash100'],
      cash200: json['cash200'],
      money5: json['money5'],
      money2: json['money2'],
      money1: json['money1'],
      money05: json['money05'],
      bruteCash: json['bruteCash'],
    );
  }
}
