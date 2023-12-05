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
    if (context.read<CashCountProvider>().cashCounts.isEmpty) {
      context.read<CashCountProvider>().loadCashCounts();
    }
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
        child: cashCounts.isNotEmpty
            ? _CashCountList(cashCounts: cashCounts)
            : const _NoCashCounts(),
      ),
    );
  }
}

class _NoCashCounts extends StatelessWidget {
  const _NoCashCounts();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        'No hay arqueos de caja registrados\n\nTrata de agregar uno',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _CashCountList extends StatelessWidget {
  const _CashCountList({required this.cashCounts});

  final List<CashCount> cashCounts;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: cashCounts.length,
        itemBuilder: (context, index) {
          return CashCountCard(cashCount: cashCounts[index]);
        },
      ),
    );
  }
}
