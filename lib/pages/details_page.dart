import 'package:arqueo_caja/models/cash_count.dart';
import 'package:arqueo_caja/models/day_cash_count.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsPage extends StatelessWidget {
  final DayCashCount dayCashCount;

  const DetailsPage({super.key, required this.dayCashCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Divider(),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _SideCashCountDetail(
                  cashCount: dayCashCount.initialCashCount, title: 'Inicio'),
              ...(dayCashCount.finalCashCount == null
                  ? []
                  : [
                      _VerticalDivider(),
                      _SideCashCountDetail(
                          cashCount: dayCashCount.finalCashCount!,
                          title: 'Final')
                    ])
            ],
          ),
        ],
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: MediaQuery.of(context).size.height * 0.7,
      color: Colors.grey,
    );
  }
}

class _SideCashCountDetail extends StatelessWidget {
  final CashCount cashCount;
  final String title;

  const _SideCashCountDetail({required this.cashCount, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          NumberFormat.currency().format(cashCount.amount),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
