import 'package:ekilibra_spa/app/config/helpers/datetime_helper.dart';
import 'package:ekilibra_spa/app/config/service_locator/service_locator.dart';
import 'package:ekilibra_spa/app/pages/quote/bloc/quote_bloc.dart';
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyQuotes extends StatefulWidget {
  static const name = '/my_quotes';
  const MyQuotes({super.key});

  @override
  State<MyQuotes> createState() => _MyQuotesState();
}

class _MyQuotesState extends State<MyQuotes> {
  late final quoteBloc = getIt.get<QuoteBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis servicios'),
      ),
      body: BlocBuilder<QuoteBloc, QuoteState>(
        buildWhen: (previous, current) {
          return current is GetQuotesState ||
              current is UpdateQuotesState ||
              current is DeleteQuoteState;
        },
        builder: (context, state) {
          if (state is GetQuotesState ||
              state is UpdateQuotesState ||
              state is DeleteQuoteState) {
            return _CardQuotes(myQuotes: state.data.quotes ?? []);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    quoteBloc.add(GetQuoteEvent());
  }
}

class _CardQuotes extends StatefulWidget {
  const _CardQuotes({
    required this.myQuotes,
  });

  final List<Quote> myQuotes;

  @override
  State<_CardQuotes> createState() => _CardQuotesState();
}

class _CardQuotesState extends State<_CardQuotes> {
  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      border: Border.all(
        color:
            // DatetimeHelper().validateDateNow(quote.day ?? '', '')
            //     ? Colors.purple
            Colors.green,
        width: 2.0,
      ), //TODO: validar fecha de quote para mostrar el color del borde
      borderRadius: BorderRadius.circular(10),
    );

    late final quoteBloc = context.read<QuoteBloc>();

    return ListView.builder(
      itemCount: widget.myQuotes.length,
      itemBuilder: (context, index) {
        final quote = widget.myQuotes[index];

        if (quote.isEnable ?? true) {
          return _CardQuoteView(
            decoration: decoration,
            quote: quote,
            quoteBloc: quoteBloc,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _CardQuoteView extends StatefulWidget {
  const _CardQuoteView({
    required this.decoration,
    required this.quote,
    required this.quoteBloc,
  });

  final BoxDecoration decoration;
  final Quote quote;
  final QuoteBloc quoteBloc;

  @override
  State<_CardQuoteView> createState() => _CardQuoteViewState();
}

class _CardQuoteViewState extends State<_CardQuoteView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: widget.decoration,
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                textAlign: TextAlign.center,
                widget.quote.service?.title ?? '',
                maxLines: 2,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    'Día: ${DatetimeHelper().dayToString(widget.quote.day ?? '')}'),
                Text('Hora: ${widget.quote.hour}'),
              ],
            ),
            Text('Lugar: ${widget.quote.place}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ButtonHelp(
                  onPressed: () {
                    //TODO: lugar
                  },
                  text: 'Lugar',
                  icon: Icons.map_outlined,
                ),
                _ButtonHelp(
                  onPressed: () {
                    //TODO: llamar
                  },
                  text: 'Llamar',
                  icon: Icons.call,
                ),
                _ButtonHelp(
                  onPressed: () {
                    //TODO: editar
                  },
                  text: 'Editar',
                  icon: Icons.edit,
                ),
                _ButtonHelp(
                  onPressed: () {
                    widget.quoteBloc.add(
                        DeleteQuoteEvent(widget.quote.service?.title ?? ''));
                  },
                  text: 'Cancelar',
                  icon: Icons.cancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ButtonHelp extends StatelessWidget {
  const _ButtonHelp({
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  final Function() onPressed;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Icon(
              icon,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
