import 'package:arqueo_caja/custom/cashcount_result_card.dart';
import 'package:arqueo_caja/models/props.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Props arguments = ModalRoute.of(context)?.settings.arguments as Props;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
        centerTitle: true,
        leading: const Icon(Icons.attachment_outlined),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: const Text(
          'Ir a inicio',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.add),
      ),
      body: Center(
        child: CashCountResultCard(cashCount: arguments.cashCount),
      ),
    );
  }
}
