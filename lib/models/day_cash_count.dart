import 'package:arqueo_caja/models/cash_count.dart';

class DayCashCount {
  final String id;
  final CashCount initialCashCount;
  CashCount? finalCashCount;
  final DateTime date;

  DayCashCount({
    required this.id,
    required this.initialCashCount,
    this.finalCashCount,
    required this.date,
  });

  void setFinalCashCount(CashCount finalCashCount) {
    this.finalCashCount = finalCashCount;
  }

  factory DayCashCount.fromJson(Map<String, dynamic> json) {
    return DayCashCount(
      id: json['id'],
      initialCashCount: CashCount.fromJson(json['initialCashCount']),
      finalCashCount: json['finalCashCount'] != null
          ? CashCount.fromJson(json['finalCashCount'])
          : null,
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'initialCashCount': initialCashCount.toJson(),
      'finalCashCount': finalCashCount?.toJson(),
      'date': date.toIso8601String(),
    };
  }
}
