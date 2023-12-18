import 'package:arqueo_caja/custom/daycashcount_card.dart';
import 'package:arqueo_caja/models/day_cash_count.dart';
import 'package:arqueo_caja/models/props.dart';
import 'package:arqueo_caja/providers/daycashcount_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DayCashCount> dayCashCounts = [];

  @override
  void initState() {
    if (context.read<DayCashCountProvider>().dayCashCounts.isEmpty) {
      context.read<DayCashCountProvider>().loadCashCounts();
    }
    super.initState();
  }

  @override
  void dispose() {
    context.read<DayCashCountProvider>().saveDayCashCounts();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dayCashCounts =
        context.watch<DayCashCountProvider>().dayCashCounts.reversed.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Arqueo de Caja'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (dayCashCounts.isNotEmpty &&
              dayCashCounts.first.finalCashCount == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    'Tienes un arqueo sin finalizar, finalizalo antes de agregar otro',
                    style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.red,
                duration: Duration(milliseconds: 1500),
              ),
            );

            return;
          }

          Navigator.pushNamed(context, '/add',
              arguments: Props(where: '/result'));
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: dayCashCounts.isNotEmpty
            ? _CashCountList(dayCashCounts: dayCashCounts)
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
  const _CashCountList({required this.dayCashCounts});

  final List<DayCashCount> dayCashCounts;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListView.separated(
        itemCount: dayCashCounts.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return CashCountCard(dayCashCount: dayCashCounts[index]);
        },
      ),
    );
  }
}
