// ignore: file_names
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:flutter/material.dart';

class DetailQuote extends StatefulWidget {
  final Quote quote;

  const DetailQuote({super.key, required this.quote});

  @override
  State<DetailQuote> createState() => _DetailQuoteState();
}

class _DetailQuoteState extends State<DetailQuote> {
  late Quote quote = widget.quote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del agendameinto'),
      ),
      body: Column(
        children: [
          const Text("Scroll de imagenes del servicio, mostrar colores"),
          const Text("Resumen"),
          const Text("duración"),
          Text(quote.hour ?? ''),
          Text("${quote.place}, botón de cómo llegar o dirección"),
          if (quote.observation?.isNotEmpty == true) Text(quote.observation!),
          const Text("botón de confirmar, que cree el servicio"),
        ],
      ),
    );
  }
}
