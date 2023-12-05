import 'package:arqueo_caja/models/cash_count.dart';
import 'package:flutter/material.dart';

class CashCountProvider extends ChangeNotifier {
  final List<CashCount> _cashCounts = [];

  List<CashCount> get cashCounts => _cashCounts;

  // TODO: Implementar metodo para obtener la lista de shared preferences

  void addCashCount(CashCount cashCount) {
    _cashCounts.add(cashCount);
    notifyListeners();
  }
}
