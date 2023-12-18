import 'package:arqueo_caja/models/day_cash_count.dart';
import 'package:flutter/material.dart';

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
        children: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Inicio',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Fin',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
