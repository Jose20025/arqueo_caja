import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arqueo de Caja'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Bienvenido, aquí encontrarás tus arqueos de caja.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
