import 'dart:convert';

import 'package:arqueo_caja/models/cash_count.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashCountProvider extends ChangeNotifier {
  final List<CashCount> _cashCounts = [];

  List<CashCount> get cashCounts => _cashCounts;

  void loadCashCounts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? cashCountsStringsList = prefs.getStringList('cashCounts');

    if (cashCountsStringsList != null) {
      _cashCounts.clear();
      for (String cashCountString in cashCountsStringsList) {
        _cashCounts.add(CashCount.fromJson(jsonDecode(cashCountString)));
      }
    }

    notifyListeners();
  }

  void addCashCount(CashCount cashCount) {
    _cashCounts.add(cashCount);
    notifyListeners();
  }

  void saveCashCounts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> cashCountsStringsList = [];

    for (CashCount cashCount in _cashCounts) {
      cashCountsStringsList.add(jsonEncode(cashCount.toJson()));
    }

    prefs.setStringList('cashCounts', cashCountsStringsList);
  }
}
