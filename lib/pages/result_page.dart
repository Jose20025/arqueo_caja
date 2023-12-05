import 'package:arqueo_caja/models/cash_count.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CashCount? cashCount =
        ModalRoute.of(context)?.settings.arguments as CashCount?;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Resultados'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(Icons.arrow_back),
          )),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: SizedBox(
                  height: 180,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const ListTile(
                        leading: Icon(Icons.attach_money),
                        title: Text('Total'),
                      ),
                      Text(
                        '      ${NumberFormat.currency().format(cashCount!.amount)}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const ListTile(
                        leading: Icon(Icons.date_range),
                        title: Text('Fecha'),
                      ),
                      Text(
                        '      ${DateFormat.yMMMMd().format(cashCount.date)}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
