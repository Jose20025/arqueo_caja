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
    return GestureDetector(
      onTap: cashCount.finalAmount == 0
          ? () {
              Navigator.pushNamed(context, '/add',
                  arguments: Props(cashCount: cashCount, where: '/complete'));
            }
          : () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Este arqueo ya fue finalizado, no se puede editar',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                  duration: Duration(milliseconds: 1500),
                ),
              );
            },
      child: Column(
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
                              .format(cashCount.initalAmount),
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
                      padding: const EdgeInsets.only(left: 20, bottom: 15),
                      child: Text(
                        DateFormat.yMEd().format(cashCount.date),
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
      ),
    );
  }
}
