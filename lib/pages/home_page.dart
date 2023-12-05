import 'package:arqueo_caja/custom/cashcount_card.dart';
import 'package:arqueo_caja/models/cash_count.dart';
import 'package:arqueo_caja/providers/cashcount_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CashCount> cashCounts = [];

  @override
  void initState() {
    context.read<CashCountProvider>().loadCashCounts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cashCounts = context.watch<CashCountProvider>().cashCounts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Arqueo de Caja'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
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
