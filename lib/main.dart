import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arqueo de Caja',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Arqueo de Caja'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
