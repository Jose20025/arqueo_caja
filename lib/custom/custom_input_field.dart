import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final double? width;
  final void Function(String?)? onSaved;
  const CustomInputField(
      {super.key, required this.label, required this.width, this.onSaved});

  InputDecoration inputStyle(String label) {
    return InputDecoration(
      label: Text(label),
      border: const OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        decoration: inputStyle(label),
        keyboardType: TextInputType.number,
        onSaved: onSaved,
      ),
    );
  }
}
