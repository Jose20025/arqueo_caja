import 'package:arqueo_caja/models/cash_count.dart';
import 'package:arqueo_caja/models/props.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashCountCard extends StatelessWidget {
  const CashCountCard({
    super.key,
    required this.cashCount,
  });

  final CashCount cashCount;

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
                        NumberFormat.currency().format(cashCount.initalAmount),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        NumberFormat.currency().format(cashCount.finalAmount),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text('Fecha'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat.yMEd().format(cashCount.date),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        FilledButton.tonal(
                          onPressed: cashCount.finalAmount == 0
                              ? () {
                                  Navigator.pushNamed(context, '/add',
                                      arguments: Props(
                                          cashCount: cashCount,
                                          where: '/complete'));
                                }
                              : null,
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(1),
                          ),
                          child: const Text('Cerrar arqueo'),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  FilledButton(
                    onPressed: () {},
                    child: const Text(
                      'Ver detalles',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
