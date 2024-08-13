import 'package:flutter/material.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar cita'),
      ),
      body: const Column(
        children: [
          Text('Seleccionar servicio'),
          Text('Seleccionar fecha'),
          Text('Seleccionar hora'),
          Text('Seleccionar lugar'),
          Text('Observaciones'),
        ],
      ),
    );
  }
}
