import 'package:ekilibra_spa/app/config/helpers/datetime_helper.dart';
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:flutter/material.dart';

class DetailQuoteService extends StatelessWidget {
  const DetailQuoteService({
    super.key,
    required this.quote,
  });

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      border: Border.all(
        color: Colors.purple,
        width: 2.0,
      ), //TODO: validar fecha de quote para mostrar el color del borde
      borderRadius: BorderRadius.circular(10),
    );

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: decoration,
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                quote.service?.title ?? '',
                maxLines: 2,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Día: ${DatetimeHelper().dayToString(quote.day ?? '')}'),
                Text('Hora: ${quote.hour}'),
              ],
            ),
            Text('Lugar: ${quote.place}'),
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
                    //TODO: cancelar
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
