import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final double? width;
  final void Function(String?)? onSaved;
  final void Function(String)? onChange;
  final TextEditingController? controller;
  const CustomInputField(
      {super.key,
      required this.label,
      required this.width,
      this.onSaved,
      this.onChange,
      this.controller});

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
        controller: controller,
        decoration: inputStyle(label),
        keyboardType: TextInputType.number,
        onSaved: onSaved,
        onChanged: onChange,
      ),
    );
  }
}
