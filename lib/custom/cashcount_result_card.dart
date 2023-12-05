import 'package:arqueo_caja/models/cash_count.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashCountResultCard extends StatelessWidget {
  const CashCountResultCard({
    super.key,
    required this.cashCount,
  });

  final CashCount? cashCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text('Plata en caja'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      NumberFormat.currency().format(cashCount!.initalAmount),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text('Fecha'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 15),
                    child: Text(
                      DateFormat.yMEd().format(cashCount!.date),
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
