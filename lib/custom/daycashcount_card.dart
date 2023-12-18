import 'package:arqueo_caja/models/day_cash_count.dart';
import 'package:arqueo_caja/models/props.dart';
import 'package:arqueo_caja/pages/details_page.dart';
import 'package:arqueo_caja/providers/daycashcount_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CashCountCard extends StatelessWidget {
  const CashCountCard({
    super.key,
    required this.dayCashCount,
  });

  final DayCashCount dayCashCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text('Plata en caja'),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Inicio',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Fin',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        NumberFormat.currency()
                            .format(dayCashCount.initialCashCount.amount),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        NumberFormat.currency().format(
                            dayCashCount.finalCashCount == null
                                ? 0
                                : dayCashCount.finalCashCount!.amount),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ListTile(
                    leading: const Icon(Icons.date_range),
                    title: const Text('Fecha'),
                    subtitle: Text(
                      DateFormat.yMEd().format(dayCashCount.date),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 5),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailsPage(
                          dayCashCount: dayCashCount,
                        ),
                      ));
                    },
                    child: const Text(
                      'Ver detalles',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilledButton.tonal(
                        onPressed: dayCashCount.finalCashCount == null
                            ? () {
                                Navigator.pushNamed(context, '/add',
                                    arguments: Props(
                                        dayCashCount: dayCashCount,
                                        where: '/complete'));
                              }
                            : null,
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(1),
                        ),
                        child: const Text('Cerrar arqueo'),
                      ),
                      FilledButton.tonalIcon(
                        onPressed: () {
                          context
                              .read<DayCashCountProvider>()
                              .deleteDayCashCount(dayCashCount.id);
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text('Eliminar'),
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.red)),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
