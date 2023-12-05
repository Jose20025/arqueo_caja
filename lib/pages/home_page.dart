import 'package:arqueo_caja/custom/cashcount_card.dart';
import 'package:arqueo_caja/models/cash_count.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CashCount> cashCounts = [
    CashCount(amount: 2540.2, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arqueo de Caja'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: cashCounts.length,
            itemBuilder: (context, index) {
              return CashCountCard(cashCount: cashCounts[index]);
            },
          ),
        ),
      ),
    );
  }
}
