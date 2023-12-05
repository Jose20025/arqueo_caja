import 'package:arqueo_caja/models/cash_count.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashCountCard extends StatelessWidget {
  final CashCount cashCount;

  const CashCountCard({super.key, required this.cashCount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.attach_money),
        title: Text(
          NumberFormat.currency().format(cashCount.amount),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
            DateFormat("EEEE, dd 'de' MMMM - yyyy").format(cashCount.date)),
      ),
    );
  }
}
