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
          const Center(
            child: Text(
              'Detalles del Arqueo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          _DetailsCard(dayCashCount),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Arqueo Inicial',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          _DetailsCashCountCard(
            cashCount: dayCashCount.initialCashCount,
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Arqueo Final',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          dayCashCount.finalCashCount == null
              ? const Center(
                  child: Text(
                    'No se ha realizado el arqueo final',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : _DetailsCashCountCard(
                  cashCount: dayCashCount.finalCashCount!,
                ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  final DayCashCount dayCashCount;

  const _DetailsCard(this.dayCashCount);

  Widget _buildDescription() {
    if (dayCashCount.finalCashCount == null) {
      return const Text('No se ha realizado el arqueo final');
    }

    if (dayCashCount.finalCashCount!.amount ==
        dayCashCount.initialCashCount.amount) {
      return const Text('La caja cuadró perfectamente');
    }

    if (dayCashCount.finalCashCount!.amount >
        dayCashCount.initialCashCount.amount) {
      return const Text('Sobró plata en el arqueo final');
    }

    return const Text('Faltó plata en el arqueo final');
  }

  Text _buildIcon() {
    if (dayCashCount.finalCashCount == null) {
      return const Text('');
    }

    if (dayCashCount.finalCashCount!.amount ==
        dayCashCount.initialCashCount.amount) {
      return const Text(
        '👍',
        style: TextStyle(fontSize: 20),
      );
    }

    if (dayCashCount.finalCashCount!.amount >
        dayCashCount.initialCashCount.amount) {
      return const Text(
        '🤑',
        style: TextStyle(fontSize: 20),
      );
    }

    return const Text(
      '💀',
      style: TextStyle(fontSize: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text('Fecha'),
              trailing: Text(
                DateFormat.yMMMMEEEEd().format(dayCashCount.date),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: const Text('Diferencia'),
              trailing: Text(
                dayCashCount.finalCashCount != null
                    ? NumberFormat.currency().format(
                        dayCashCount.finalCashCount!.amount -
                            dayCashCount.initialCashCount.amount)
                    : 'No hay arqueo final',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: const Text('Descripción'),
              subtitle: _buildDescription(),
              trailing: _buildIcon(),
            )
          ],
        ),
      ),
    );
  }
}

class _DetailsCashCountCard extends StatelessWidget {
  final CashCount cashCount;

  const _DetailsCashCountCard({required this.cashCount});

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontSize: 16);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text('Billetes de 200'),
              trailing: Text(
                cashCount.cash200 == null ? '0' : cashCount.cash200.toString(),
                style: style,
              ),
            ),
            ListTile(
              title: const Text('Billetes de 100'),
              trailing: Text(
                cashCount.cash100 == null ? '0' : cashCount.cash100.toString(),
                style: style,
              ),
            ),
            ListTile(
              title: const Text('Billetes de 50'),
              trailing: Text(
                cashCount.cash50 == null ? '0' : cashCount.cash50.toString(),
                style: style,
              ),
            ),
            ListTile(
              title: const Text('Billetes de 20'),
              trailing: Text(
                cashCount.cash20 == null ? '0' : cashCount.cash20.toString(),
                style: style,
              ),
            ),
            ListTile(
              title: const Text('Billetes de 10'),
              trailing: Text(
                cashCount.cash10 == null ? '0' : cashCount.cash10.toString(),
                style: style,
              ),
            ),
            ListTile(
              title: const Text('Monedas de 5'),
              trailing: Text(
                cashCount.money5 == null ? '0' : cashCount.money5.toString(),
                style: style,
              ),
            ),
            ListTile(
              title: const Text('Monedas de 2'),
              trailing: Text(
                cashCount.money2 == null ? '0' : cashCount.money2.toString(),
                style: style,
              ),
            ),
            ListTile(
              title: const Text('Monedas de 1'),
              trailing: Text(
                cashCount.money1 == null ? '0' : cashCount.money1.toString(),
                style: style,
              ),
            ),
            ListTile(
              title: const Text('Monedas de 0.50'),
              trailing: Text(
                cashCount.money05 == null ? '0' : cashCount.money05.toString(),
                style: style,
              ),
            ),
            ListTile(
              title: const Text('Total'),
              trailing: Text(
                NumberFormat.currency().format(cashCount.amount),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
