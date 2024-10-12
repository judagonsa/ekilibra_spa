// ignore: file_names
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:ekilibra_spa/app/widgets/banners/banners.dart';
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
    // return Banners();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del agendameinto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Banners(images: ['', '']), //TODO: enviar imagenes
            Text(quote.service?.resumen ?? ''),
            Text(quote.service?.observation ?? ''),
            Text(quote.service?.duration ?? ''),
            Text("${quote.place}, botón de cómo llegar o dirección"),
            Text(quote.hour ?? ''),
            if (quote.observation?.isNotEmpty == true) Text(quote.observation!),
            const Text("botón de confirmar, que cree el servicio"),
          ],
        ),
      ),
    );
  }
}
