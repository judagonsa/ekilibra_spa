// ignore: file_names
import 'package:ekilibra_spa/app/config/helpers/button_helpers.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Banners(
                images: ['', '']), //TODO: enviar imagenes desde el servicio
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(quote.service?.resumen ?? ''),
                  Text(quote.service?.observation ?? ''),
                  Text('Duración:  ${quote.service?.duration ?? ''}'),
                  Text(
                      "Lugar: ${quote.place}, botón de cómo llegar o dirección"),
                  Text('Hora: ${quote.hour ?? ''}'),
                  if (quote.observation?.isNotEmpty == true)
                    Text(quote.observation!),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: OutlinedButton(
                  onPressed: () {
                    //TODO: crear recordatorio desde el bloc de quote
                  },
                  style: ButtonHelpers().secondaryButton(),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Confirmar cita',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
