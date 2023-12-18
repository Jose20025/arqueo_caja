import 'package:arqueo_caja/custom/custom_input_field.dart';
import 'package:arqueo_caja/models/cash_count.dart';
import 'package:arqueo_caja/models/day_cash_count.dart';
import 'package:arqueo_caja/models/props.dart';
import 'package:arqueo_caja/providers/daycashcount_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddCashCountPage extends StatefulWidget {
  const AddCashCountPage({super.key});

  @override
  State<AddCashCountPage> createState() => _AddCashCountPageState();
}

class _AddCashCountPageState extends State<AddCashCountPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int? cash10;
  int? cash20;
  int? cash50;
  int? cash100;
  int? cash200;

  int? money5;
  int? money2;
  int? money1;
  int? money05;

  double? backCash;
  double? backMoney;

  void saveCashCount(Props arguments) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      double total = calculateTotal();

      if (total == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('El arqueo no puede ser 0',
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red,
            duration: Duration(milliseconds: 1500),
          ),
        );
        return;
      }

      if (arguments.where! == '/complete') {
        CashCount finalCashCount = CashCount(
          amount: total,
          cash10: cash10,
          cash20: cash20,
          cash50: cash50,
          cash100: cash100,
          cash200: cash200,
          money5: money5,
          money2: money2,
          money1: money1,
          money05: money05,
          backCash: backCash,
          backMoney: backMoney,
        );

        context
            .read<DayCashCountProvider>()
            .completeDayCashCount(arguments.dayCashCount!.id, finalCashCount);

        context.read<DayCashCountProvider>().saveDayCashCounts();

        Navigator.of(context).pop();
      } else {
        CashCount initialCashCount = CashCount(
          amount: total,
          cash10: cash10,
          cash20: cash20,
          cash50: cash50,
          cash100: cash100,
          cash200: cash200,
          money5: money5,
          money2: money2,
          money1: money1,
          money05: money05,
          backCash: backCash,
          backMoney: backMoney,
        );

        DayCashCount dayCashCount = DayCashCount(
          id: const Uuid().v4(),
          date: DateTime.now(),
          initialCashCount: initialCashCount,
        );

        context.read<DayCashCountProvider>().addDayCashCount(dayCashCount);
        context.read<DayCashCountProvider>().saveDayCashCounts();

        Navigator.pop(context);
      }
    }
  }

  double calculateTotal() {
    double total = 0;

    total += (cash10!) * 10;
    total += (cash20!) * 20;
    total += (cash50!) * 50;
    total += (cash100!) * 100;
    total += (cash200!) * 200;

    total += (money5!) * 5;
    total += (money2!) * 2;
    total += (money1!) * 1;
    total += (money05!) * 0.5;

    total += backCash!;
    total += backMoney!;

    return total;
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Props;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo arqueo de caja'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => saveCashCount(arguments),
        child: const Icon(Icons.save),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomInputField(
                    label: 'Billetes de 100',
                    width: 150,
                    onSaved: (value) {
                      cash100 =
                          int.tryParse(value!) != null ? int.parse(value) : 0;
                    },
                  ),
                  CustomInputField(
                      label: 'Billetes de 200',
                      width: 150,
                      onSaved: (value) {
                        cash200 =
                            int.tryParse(value!) != null ? int.parse(value) : 0;
                      }),
                ],
              ),
              const SizedBox(height: 20),
              CustomInputField(
                  label: 'Billetes de 50',
                  width: 345,
                  onSaved: (value) {
                    cash50 =
                        int.tryParse(value!) != null ? int.parse(value) : 0;
                  }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomInputField(
                      label: 'Billetes de 10',
                      width: 150,
                      onSaved: (value) {
                        cash10 =
                            int.tryParse(value!) != null ? int.parse(value) : 0;
                      }),
                  CustomInputField(
                      label: 'Billetes de 20',
                      width: 150,
                      onSaved: (value) {
                        cash20 =
                            int.tryParse(value!) != null ? int.parse(value) : 0;
                      }),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomInputField(
                      label: 'Monedas de 5',
                      width: 150,
                      onSaved: (value) {
                        money5 =
                            int.tryParse(value!) != null ? int.parse(value) : 0;
                      }),
                  CustomInputField(
                      label: 'Monedas de 2',
                      width: 150,
                      onSaved: (value) {
                        money2 =
                            int.tryParse(value!) != null ? int.parse(value) : 0;
                      }),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomInputField(
                      label: 'Monedas de 1',
                      width: 150,
                      onSaved: (value) {
                        money1 =
                            int.tryParse(value!) != null ? int.parse(value) : 0;
                      }),
                  CustomInputField(
                      label: 'Monedas de 0,5',
                      width: 150,
                      onSaved: (value) {
                        money05 =
                            int.tryParse(value!) != null ? int.parse(value) : 0;
                      }),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              CustomInputField(
                label: 'Plata de atrás',
                width: 345,
                onSaved: (value) {
                  backCash =
                      double.tryParse(value!) != null ? double.parse(value) : 0;
                },
              ),
              const SizedBox(height: 20),
              CustomInputField(
                label: 'Monedas de atrás',
                width: 345,
                onSaved: (value) {
                  backMoney =
                      double.tryParse(value!) != null ? double.parse(value) : 0;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
