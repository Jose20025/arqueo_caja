import 'package:arqueo_caja/constants/menu_entries.dart';
import 'package:arqueo_caja/custom/custom_input_field.dart';
import 'package:arqueo_caja/custom/mini_cashcount_tile.dart';
import 'package:arqueo_caja/models/cash_count.dart';
import 'package:arqueo_caja/models/day_cash_count.dart';
import 'package:arqueo_caja/models/props.dart';
import 'package:arqueo_caja/providers/daycashcount_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:arqueo_caja/models/mini_cashcount.dart';
import 'package:flutter/material.dart';

class AddCashCountPage extends StatefulWidget {
  const AddCashCountPage({super.key});

  @override
  State<AddCashCountPage> createState() => _AddCashCountPageState();
}

class _AddCashCountPageState extends State<AddCashCountPage> {
  final List<MiniCashCount> miniCashCounts = [];
  final TextEditingController _amountController = TextEditingController();
  String? optionSelected;

  void changeDropdownValue(String newValue) {
    setState(() {
      optionSelected = newValue;
    });
  }

  void changeAmount(String newValue) {
    if (newValue.isEmpty) {
      return;
    }

    setState(() {
      _amountController.text = newValue;
    });
  }

  void deleteMiniCashCount(String id) {
    setState(() {
      miniCashCounts.removeWhere((element) => element.id == id);
    });
  }

  void onSaveCashCount(Props arguments) {
    ScaffoldMessenger.of(context).clearSnackBars();

    if (miniCashCounts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Debe agregar al menos un elemento',
            style: TextStyle(color: Colors.white),
          ),
          closeIconColor: Colors.white,
          duration: Duration(seconds: 1),
          showCloseIcon: true,
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    double total = 0;
    Map<String, dynamic> cashCountMap = {};

    for (MiniCashCount miniCashCount in miniCashCounts) {
      total += miniCashCount.total;

      switch (miniCashCount.name) {
        case 'Billetes de 200':
          if (cashCountMap.containsKey('cash200')) {
            cashCountMap['cash200'] += miniCashCount.amount;
          } else {
            cashCountMap['cash200'] = miniCashCount.amount;
          }

          break;
        case 'Billetes de 100':
          if (cashCountMap.containsKey('cash100')) {
            cashCountMap['cash100'] += miniCashCount.amount;
          } else {
            cashCountMap['cash100'] = miniCashCount.amount;
          }

          break;
        case 'Billetes de 50':
          if (cashCountMap.containsKey('cash50')) {
            cashCountMap['cash50'] += miniCashCount.amount;
          } else {
            cashCountMap['cash50'] = miniCashCount.amount;
          }
          break;
        case 'Billetes de 20':
          if (cashCountMap.containsKey('cash20')) {
            cashCountMap['cash20'] += miniCashCount.amount;
          } else {
            cashCountMap['cash20'] = miniCashCount.amount;
          }
          break;
        case 'Billetes de 10':
          if (cashCountMap.containsKey('cash10')) {
            cashCountMap['cash10'] += miniCashCount.amount;
          } else {
            cashCountMap['cash10'] = miniCashCount.amount;
          }
          break;
        case 'Monedas de 5':
          if (cashCountMap.containsKey('money5')) {
            cashCountMap['money5'] += miniCashCount.amount;
          } else {
            cashCountMap['money5'] = miniCashCount.amount;
          }
          break;
        case 'Monedas de 2':
          if (cashCountMap.containsKey('money2')) {
            cashCountMap['money2'] += miniCashCount.amount;
          } else {
            cashCountMap['money2'] = miniCashCount.amount;
          }
          break;
        case 'Monedas de 1':
          if (cashCountMap.containsKey('money1')) {
            cashCountMap['money1'] += miniCashCount.amount;
          } else {
            cashCountMap['money1'] = miniCashCount.amount;
          }
          break;
        case 'Monedas de 0.50':
          if (cashCountMap.containsKey('money05')) {
            cashCountMap['money05'] += miniCashCount.amount;
          } else {
            cashCountMap['money05'] = miniCashCount.amount;
          }
          break;
        case 'Monto bruto':
          if (cashCountMap.containsKey('bruteCash')) {
            cashCountMap['bruteCash'] += miniCashCount.total;
          } else {
            cashCountMap['bruteCash'] = miniCashCount.total;
          }
          break;
      }
    }

    //* Creamos el cashcount
    CashCount cashCount = CashCount(
      amount: total,
      cash10: cashCountMap['cash10'],
      cash20: cashCountMap['cash20'],
      cash50: cashCountMap['cash50'],
      cash100: cashCountMap['cash100'],
      cash200: cashCountMap['cash200'],
      money5: cashCountMap['money5'],
      money2: cashCountMap['money2'],
      money1: cashCountMap['money1'],
      money05: cashCountMap['money05'],
      bruteCash: cashCountMap['bruteCash'],
    );

    if (arguments.where! == '/result') {
      //* Se agrega el primer cashcount al daycashcount
      DayCashCount newDayCashCount = DayCashCount(
        id: const Uuid().v4(),
        date: DateTime.now(),
        initialCashCount: cashCount,
      );

      //* Se agrega el daycashcount al provider
      context.read<DayCashCountProvider>().addDayCashCount(newDayCashCount);
    } else if (arguments.where! == '/complete') {
      context
          .read<DayCashCountProvider>()
          .completeDayCashCount(arguments.dayCashCount!.id, cashCount);
    } else if (arguments.where! == '/initial') {
      context
          .read<DayCashCountProvider>()
          .editInitialCashCount(arguments.dayCashCount!.id, cashCount);
    } else {
      context
          .read<DayCashCountProvider>()
          .editFinalCashCount(arguments.dayCashCount!.id, cashCount);
    }

    //* Se guarda el daycashcount en el storage
    context.read<DayCashCountProvider>().saveDayCashCounts();

    //* Se regresa a la home page
    Navigator.pop(context);
  }

  void onAdd() {
    ScaffoldMessenger.of(context).clearSnackBars();

    if (optionSelected == null || optionSelected!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Debe seleccionar una opción',
            style: TextStyle(color: Colors.white),
          ),
          closeIconColor: Colors.white,
          duration: Duration(seconds: 1),
          showCloseIcon: true,
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_amountController.text.isEmpty || _amountController.text == '0') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Debe ingresar una cantidad',
            style: TextStyle(color: Colors.white),
          ),
          closeIconColor: Colors.white,
          duration: Duration(seconds: 1),
          showCloseIcon: true,
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    String name = '';
    double total = 0;

    switch (optionSelected) {
      case 'b200':
        name = 'Billetes de 200';
        total = 200 * double.parse(_amountController.text);
        break;
      case 'b100':
        name = 'Billetes de 100';
        total = 100 * double.parse(_amountController.text);
        break;
      case 'b50':
        name = 'Billetes de 50';
        total = 50 * double.parse(_amountController.text);
        break;
      case 'b20':
        name = 'Billetes de 20';
        total = 20 * double.parse(_amountController.text);
        break;
      case 'b10':
        name = 'Billetes de 10';
        total = 10 * double.parse(_amountController.text);
        break;
      case 'm5':
        name = 'Monedas de 5';
        total = 5 * double.parse(_amountController.text);
        break;
      case 'm2':
        name = 'Monedas de 2';
        total = 2 * double.parse(_amountController.text);
        break;
      case 'm1':
        name = 'Monedas de 1';
        total = 1 * double.parse(_amountController.text);
        break;
      case 'm050':
        name = 'Monedas de 0.50';
        total = 0.5 * double.parse(_amountController.text);
        break;
      case 'bruto':
        name = 'Monto bruto';
        total = double.parse(_amountController.text);
        break;
    }

    setState(() {
      miniCashCounts.add(MiniCashCount(
          id: const Uuid().v4(),
          name: name,
          amount: int.parse(_amountController.text),
          total: total));
    });

    _amountController.clear();
    optionSelected = null;

    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Props;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Arqueo'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => onSaveCashCount(arguments),
        child: const Icon(Icons.save),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return MiniCashCountTile(
                    miniCashCounts[index],
                    onDelete: deleteMiniCashCount,
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: miniCashCounts.length,
              ),
            ),
            _BottomMenu(
              onAdd: onAdd,
              amountController: _amountController,
              optionSelected: optionSelected,
              changeDropdownValue: changeDropdownValue,
              changeAmount: changeAmount,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomMenu extends StatelessWidget {
  final Function() onAdd;
  final Function(String) changeDropdownValue;
  final Function(String) changeAmount;
  final TextEditingController amountController;
  final String? optionSelected;

  const _BottomMenu(
      {required this.onAdd,
      required this.changeDropdownValue,
      required this.changeAmount,
      required this.amountController,
      required this.optionSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SizedBox(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: DropdownButtonFormField(
                      items: dropdownMenuEntries,
                      value: optionSelected,
                      onChanged: (value) => changeDropdownValue(value!),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Opciones',
                      ),
                    ),
                  ),
                ),
                CustomInputField(
                  label: 'Cantidad',
                  controller: amountController,
                  width: MediaQuery.of(context).size.width * 0.4,
                  onChange: (value) => changeAmount(value),
                ),
              ],
            ),
            FilledButton.tonalIcon(
              onPressed: onAdd,
              icon: const Icon(Icons.add),
              label: const Text('Agregar'),
            )
          ],
        ),
      ),
    );
  }
}
