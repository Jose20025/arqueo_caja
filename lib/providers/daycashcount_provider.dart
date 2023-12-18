import 'dart:convert';

import 'package:arqueo_caja/models/cash_count.dart';
import 'package:arqueo_caja/models/day_cash_count.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DayCashCountProvider extends ChangeNotifier {
  List<DayCashCount> _dayCashCounts = [];

  List<DayCashCount> get dayCashCounts => _dayCashCounts;

  void loadCashCounts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? dayCashCountsStringsList =
        prefs.getStringList('dayCashCounts');

    if (dayCashCountsStringsList != null) {
      for (String dayCashCountString in dayCashCountsStringsList) {
        _dayCashCounts
            .add(DayCashCount.fromJson(jsonDecode(dayCashCountString)));
      }
    }

    notifyListeners();
  }

  void addDayCashCount(DayCashCount dayCashCount) {
    _dayCashCounts.add(dayCashCount);
    notifyListeners();
  }

  void deleteDayCashCount(String id) {
    _dayCashCounts.removeWhere((dayCashCount) => dayCashCount.id == id);
    saveDayCashCounts();
    notifyListeners();
  }

  void completeDayCashCount(String id, CashCount finalCashCount) {
    _dayCashCounts = _dayCashCounts.map((dayCashCount) {
      if (dayCashCount.id == id) {
        dayCashCount.setFinalCashCount(finalCashCount);
      }

      return dayCashCount;
    }).toList();
    notifyListeners();
  }

  void saveDayCashCounts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> cashCountsStringsList = [];

    for (DayCashCount dayCashCount in _dayCashCounts) {
      cashCountsStringsList.add(jsonEncode(dayCashCount.toJson()));
    }

    prefs.setStringList('dayCashCounts', cashCountsStringsList);
  }
}
