// ignore: file_names
import 'package:ekilibra_spa/app/config/helpers/button_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/popup_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/texts.dart';
import 'package:ekilibra_spa/app/config/service_locator/service_locator.dart';
import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';
import 'package:ekilibra_spa/app/pages/home/pages/home_page.dart';
import 'package:ekilibra_spa/app/pages/quote/bloc/quote_bloc.dart';
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:ekilibra_spa/app/widgets/banners/banners.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailQuote extends StatefulWidget {
  static const name = '/detail_quote';
  final Quote quote;
  final Service? service;

  const DetailQuote({
    super.key,
    required this.quote,
    this.service,
  });

  @override
  State<DetailQuote> createState() => _DetailQuoteState();
}

class _DetailQuoteState extends State<DetailQuote> {
  late Quote quote = widget.quote;
  late Service? service = widget.service ?? widget.quote.service;
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
                title: Texts.veryGood,
                description: 'Cita agendada exitosamente',
                icon: Icons.check,
                titleButtonOne: 'Aceptar',
                height: 140,
                onPressedOne: () => {
                  context.go(HomePage.name), //TODO: animación para ir al home
                },
              );
            });
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (service?.images != null)
                  Banners(
                    images: service!.images!,
                  ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(service?.title ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(service?.description ?? ''),
                      ),
                      if (service?.phrase != null &&
                          service?.phrase?.isNotEmpty == true)
                        //TODO: dejar bien bonita la frase, en un recuadro o algo
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(service?.phrase ?? ''),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(service?.observation ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                            '${Texts.duration}: ${service?.duration ?? ''}'),
                      ),
                      if (quote.place != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text("${Texts.place}: ${quote.place}"),
                          //TODO: botón de cómo llegar o dirección
                        ),
                      if (quote.hour != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text('${Texts.hour}: ${quote.hour}'),
                        ),
                      if (quote.observation != null &&
                          quote.observation?.isNotEmpty == true)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(quote.observation!),
                        ),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          service != null ? 'Agendar cita' : Texts.confirmQuote,
                          style: const TextStyle(fontSize: 16),
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
