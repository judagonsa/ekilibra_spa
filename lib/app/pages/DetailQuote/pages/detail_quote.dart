// ignore: file_names
import 'package:ekilibra_spa/app/config/helpers/button_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/popup_helpers.dart';
import 'package:ekilibra_spa/app/config/service_locator/service_locator.dart';
import 'package:ekilibra_spa/app/pages/quote/bloc/quote_bloc.dart';
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:ekilibra_spa/app/widgets/banners/banners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailQuote extends StatefulWidget {
  final Quote quote;

  const DetailQuote({super.key, required this.quote});

  @override
  State<DetailQuote> createState() => _DetailQuoteState();
}

class _DetailQuoteState extends State<DetailQuote> {
  late Quote quote = widget.quote;
  late QuoteBloc quoteBloc;
  @override
  Widget build(BuildContext context) {
    // return Banners();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del agendameinto'),
      ),
      body: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state) {
          if (state is CreateQuoteState) {
            Future.delayed(Duration.zero, () async {
              PopupHelpers().popupTwoButtons(
                context: context,
                withIconClose: false,
                title: "Muy bien",
                description: 'Cita agendada exitosamente',
                icon: Icons.check,
                titleButtonOne: 'Aceptar',
                titleButtonTwo: null,
                height: 140,
                onPressedOne: () => {
                  context.go('/home'), //TODO: animación para ir al home
                },
                onPressedTwo: () => {},
              );
            });
          }
          return SingleChildScrollView(
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
                        quoteBloc.add(
                          CreteQuoteEvent(
                            quote: Quote(
                              place: quote.place,
                              service: quote.service,
                              day: quote.day,
                              hour: quote.hour,
                              observation: quote.observation,
                            ),
                          ),
                        );
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
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    quoteBloc = getIt.get<QuoteBloc>();
  }
}
