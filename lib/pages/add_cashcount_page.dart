import 'package:arqueo_caja/custom/custom_input_field.dart';
import 'package:arqueo_caja/models/cash_count.dart';
import 'package:flutter/material.dart';

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

  void saveCashCount() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      double total = calculateTotal();

      CashCount cashCount = CashCount(
        amount: total,
        date: DateTime.now(),
      );

      Navigator.of(context).pushNamed('/result', arguments: cashCount);
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

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar un nuevo arqueo'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveCashCount,
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
                      cash100 = int.parse(value!);
                    },
                  ),
                  CustomInputField(
                      label: 'Billetes de 200',
                      width: 150,
                      onSaved: (value) {
                        cash200 = int.parse(value!);
                      }),
                ],
              ),
              const SizedBox(height: 20),
              CustomInputField(
                  label: 'Billetes de 50',
                  width: 345,
                  onSaved: (value) {
                    cash50 = int.parse(value!);
                  }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomInputField(
                      label: 'Billetes de 10',
                      width: 150,
                      onSaved: (value) {
                        cash10 = int.parse(value!);
                      }),
                  CustomInputField(
                      label: 'Billetes de 20',
                      width: 150,
                      onSaved: (value) {
                        cash20 = int.parse(value!);
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
                        money5 = int.parse(value!);
                      }),
                  CustomInputField(
                      label: 'Monedas de 2',
                      width: 150,
                      onSaved: (value) {
                        money2 = int.parse(value!);
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
                        money1 = int.parse(value!);
                      }),
                  CustomInputField(
                      label: 'Monedas de 0,5',
                      width: 150,
                      onSaved: (value) {
                        money05 = int.parse(value!);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
