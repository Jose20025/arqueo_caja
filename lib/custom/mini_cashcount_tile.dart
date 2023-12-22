import 'package:arqueo_caja/models/mini_cashcount.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MiniCashCountTile extends StatelessWidget {
  final MiniCashCount miniCashCount;
  final Function(String) onDelete;

  const MiniCashCountTile(this.miniCashCount,
      {super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        miniCashCount.name,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: miniCashCount.name != 'Monto bruto'
          ? Text(
              NumberFormat.currency().format(miniCashCount.total),
              style: const TextStyle(fontSize: 16),
            )
          : null,
      trailing: Text(
        NumberFormat.currency().format(miniCashCount.total),
        style: const TextStyle(fontSize: 18),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () => onDelete(miniCashCount.id),
      ),
    );
  }
}
