import 'package:arqueo_caja/custom/daycashcount_card.dart';
import 'package:arqueo_caja/models/day_cash_count.dart';
import 'package:arqueo_caja/providers/daycashcount_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<DayCashCount> dayCashCounts = [];
  late TabController _tabController;
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        selectedTab = _tabController.index;
      });
    });

    if (context.read<DayCashCountProvider>().dayCashCounts.isEmpty) {
      context.read<DayCashCountProvider>().loadCashCounts();
    }
  }

  @override
  void dispose() {
    context.read<DayCashCountProvider>().saveDayCashCounts();

    _tabController.dispose();

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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Arqueos de caja', icon: Icon(Icons.attach_money)),
            Tab(text: 'Gastos', icon: Icon(Icons.money_off)),
          ],
        ),
      ),
      floatingActionButton: selectedTab == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, 'add_cash_count');
              },
              child: const Icon(Icons.add),
            )
          : FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, 'add_expense');
              },
              child: const Icon(Icons.add_card_outlined),
            ),
      body: TabBarView(controller: _tabController, children: [
        _DayCashCounts(dayCashCounts: dayCashCounts),
        const Text('Gastos')
      ]),
    );
  }
}

class _DayCashCounts extends StatelessWidget {
  const _DayCashCounts({
    required this.dayCashCounts,
  });

  final List<DayCashCount> dayCashCounts;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: dayCashCounts.isNotEmpty
          ? _CashCountList(dayCashCounts: dayCashCounts)
          : const _NoCashCounts(),
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
