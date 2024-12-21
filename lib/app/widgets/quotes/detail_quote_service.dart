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
        height: 130,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  quote.service?.title ?? '',
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(quote.day ?? ''), //TODO: dar formato de fecha
                  Text(quote.hour ??
                      ''), //TODO: revisdar donde se guarda el minuto
                  Text(quote.place ?? ''),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      //TODO: Como llegar
                    },
                    child: const Column(children: [
                      Text('Cómo llegar',
                          style: TextStyle(color: Colors.black)),
                      Icon(
                        Icons.map_outlined,
                        color: Colors.purple,
                      ),
                    ]),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO: Llamar
                    },
                    child: const Column(
                      children: [
                        Text(
                          'Llamar',
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(
                          Icons.call,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO: Editar ?
                    },
                    child: const Column(
                      children: [
                        Text(
                          'Editar',
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO: Cancelar
                    },
                    child: const Column(
                      children: [
                        Text(
                          'Cancelar',
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(
                          Icons.cancel,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
