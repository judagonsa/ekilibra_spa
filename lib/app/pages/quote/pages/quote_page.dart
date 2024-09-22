import 'package:ekilibra_spa/app/config/exports/blocs/exports_blocs_cubits.dart';
import 'package:ekilibra_spa/app/config/helpers/button_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/datetime_helper.dart';
import 'package:ekilibra_spa/app/config/helpers/functions_helper.dart';
import 'package:ekilibra_spa/app/config/helpers/popup_helpers.dart';
import 'package:ekilibra_spa/app/config/service_locator/service_locator.dart';
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  late QuoteBloc quoteBloc;

  String placeSelected = '';
  String serviceSelected = '';
  String daySelected = '';
  String hourSelected = '';
  String minutesSelected = '';
  TextEditingController observationController = TextEditingController();
  String errorQuote = '';
  String militarHour = '';
  List<String>? places;
  List<String>? services;

  @override
  Widget build(BuildContext context) {
    final hoursQuote = ["09", "10", "11", "02", "03", "04", "05"];
    final minutesQuote = ["00", "15", "30", "45"];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 146, 153, 155),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Agendar cita'),
      ),
      body: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state) {
          if (state is LoadServicesState) {
            services = state.services;
            places = state.places;
          }
          return SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: SingleChildScrollView(
                child: Form(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 170,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    const Text('Lugar:'),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        for (var place in places ?? [])
                                          _ButtonPlace(
                                            place: place,
                                            placeSelected: placeSelected,
                                            action: () {
                                              setState(() {
                                                placeSelected = place;
                                              });
                                            },
                                          )
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text('Servicio:'),
                                    if (services != null)
                                      _DropdownMenu(
                                        hintText: 'Servicio',
                                        dataList: services!,
                                        onSelected: (value) {
                                          if (value != null) {
                                            serviceSelected = value;
                                          }
                                        },
                                        width: 250,
                                      )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          height: 190,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 10, left: 40, right: 20),
                                  child: Text('Día:'),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (var dateWeek
                                        in DatetimeHelper().getDaysOfWeek())
                                      _DaysWeek(
                                        date: dateWeek,
                                        dateSelected: daySelected != ''
                                            ? DateTime.parse(daySelected)
                                            : null,
                                        action: () {
                                          setState(() {
                                            daySelected = dateWeek.toString();
                                          });
                                        },
                                      )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text('Hora:'),
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: _DropdownMenu(
                                          hintText:
                                              'Hora', //Validar si existe hora
                                          dataList: hoursQuote,
                                          onSelected: (value) {
                                            if (value != null) {
                                              hourSelected = value;

                                              setState(() {
                                                militarHour =
                                                    (hoursQuote.indexOf(
                                                                hourSelected) <=
                                                            2)
                                                        ? 'AM'
                                                        : 'PM';
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: _DropdownMenu(
                                          hintText:
                                              'Minutos', //Validar si existe hora
                                          dataList: minutesQuote,
                                          onSelected: (value) {
                                            if (value != null) {
                                              minutesSelected = value;
                                            }
                                          },
                                        ),
                                      ),
                                      Text(militarHour),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Observaciones a tener en cuenta'),
                                TextField(
                                  controller: observationController,
                                  maxLines: 3,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                if (errorQuote.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Center(
                                      child: Text(
                                        errorQuote,
                                        maxLines: 2,
                                        style:
                                            const TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: TextButton(
                            onPressed: () => _createQuote(),
                            style: ButtonHelpers().primaryButton(
                              isLogin: false,
                              backgroundColor: Colors.purple,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              child: Text('Agendar'),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              PopupHelpers().popupTwoButtons(
                                context: context,
                                title: '¿Necesitas ayuda?',
                                description:
                                    'Si necesitas ayuda agendando tu cita o quieres consultar si hay disponibilidad para atenderte el día de hoy, no dudes en ponerte en contacto con nosotros:',
                                titleButtonOne: 'WhatsApp',
                                titleButtonTwo: "Llamar",
                                height: 220,
                                onPressedOne: () {
                                  FunctionsHelper().openWhatsApp();
                                },
                                onPressedTwo: () {
                                  launchUrlString(
                                      FunctionsHelper().numbrePhone());
                                },
                              );
                            },
                            child: const Text('¿Problemas agendando tu cita?'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _createQuote() {
    if (placeSelected.isEmpty) {
      setState(() {});
      errorQuote = 'Favor escoger un lugar';
    } else if (serviceSelected.isEmpty) {
      setState(() {});
      errorQuote = 'Favor escoger un servicio';
    } else if (daySelected.isEmpty) {
      setState(() {});
      errorQuote = 'Favor escoger el día del servicio';
    } else if (hourSelected.isEmpty) {
      setState(() {});
      errorQuote = 'Favor escoger la hora del servicio';
    } else {
      setState(() {});
      errorQuote = '';
      quoteBloc.add(
        CreteQuoteEvent(
          quote: Quote(
            place: placeSelected,
            serviceId: serviceSelected,
            day: daySelected,
            hour: hourSelected,
            observation: observationController.text,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    quoteBloc = getIt.get<QuoteBloc>();
    quoteBloc.add(LoadPlacesEvent());
  }
}

class _DaysWeek extends StatelessWidget {
  const _DaysWeek({
    required this.date,
    required this.action,
    required this.dateSelected,
  });

  final DateTime date;
  final Function()? action;
  final DateTime? dateSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: SizedBox(
        width: 50,
        child: Column(
          children: [
            TextButton(
              style: ButtonHelpers().secondaryButton(
                borderColor: Colors.purple,
                textColor: dateSelected != null
                    ? date.day == dateSelected?.day
                        ? Colors.white
                        : Colors.purple
                    : Colors.purple,
                backgrounColor: dateSelected != null
                    ? date.day == dateSelected?.day
                        ? Colors.purple
                        : Colors.white
                    : Colors.white,
              ),
              onPressed: action,
              child: Column(
                children: [
                  Text(
                    DatetimeHelper()
                        .getDayString(DateFormat('EEE').format(date)),
                    style: const TextStyle(fontSize: 11),
                  ),
                  Text(DateFormat('d').format(date))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ButtonPlace extends StatelessWidget {
  const _ButtonPlace({
    required this.place,
    required this.placeSelected,
    required this.action,
  });

  final String place;
  final String placeSelected;
  final Function()? action;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: action,
      style: ButtonHelpers().secondaryButton(
        textColor: placeSelected == place ? Colors.white : Colors.purple,
        borderColor: Colors.purple,
        backgrounColor: placeSelected == place ? Colors.purple : null,
      ),
      child: Text(place),
    );
  }
}

class _DropdownMenu extends StatelessWidget {
  final void Function(String?) onSelected;
  final List<String>? dataList;
  final String hintText;
  final double? width;

  const _DropdownMenu({
    required this.onSelected,
    required this.dataList,
    required this.hintText,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: width,
      hintText: hintText,
      onSelected: onSelected,
      dropdownMenuEntries:
          dataList!.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
        );
      }).toList(),
    );
  }
}
