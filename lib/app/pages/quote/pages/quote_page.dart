import 'package:ekilibra_spa/app/config/exports/blocs/exports_blocs_cubits.dart';
import 'package:ekilibra_spa/app/config/helpers/button_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/datetime_helper.dart';
import 'package:ekilibra_spa/app/config/helpers/functions_helper.dart';
import 'package:ekilibra_spa/app/config/helpers/popup_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/text_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/texts.dart';
import 'package:ekilibra_spa/app/config/service_locator/service_locator.dart';
import 'package:ekilibra_spa/app/pages/home/bloc/home_bloc.dart';
import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';
import 'package:ekilibra_spa/app/pages/home/pages/home_page.dart';
import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class QuotePage extends StatefulWidget {
  static const name = '/quote';
  const QuotePage({
    super.key,
    this.serviceId,
  });

  final String? serviceId;
  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  late QuoteBloc quoteBloc;

  String placeSelected = '';
  Service? serviceSelected;
  String daySelected = '';
  String hourSelected = '';
  String minutesSelected = '';
  TextEditingController observationController = TextEditingController();
  String errorQuote = '';
  String militarHour = '';

  @override
  Widget build(BuildContext context) {
    final hoursQuote = ["09", "10", "11", "02", "03", "04", "05"];
    final minutesQuote = ["00", "15", "30", "45"];

    final List<String>? places = context.read<HomeBloc>().state.places;

    if (widget.serviceId != null) {
      serviceSelected =
          context.read<HomeBloc>().getServiceFromId(widget.serviceId!);
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 223, 224),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(Texts.scheduleQuote),
      ),
      body: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state) {
          if (state is CreateQuoteState) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              PopupHelpers().popupTwoButtons(
                context: context,
                withIconClose: false,
                title: 'Muy bien',
                description: 'Servicio agendado con exito',
                icon: Icons.check_circle,
                titleButtonOne: "Aceptar",
                height: 140,
                onPressedOne: () {
                  quoteBloc.add(ResetBloc());
                  context.go(HomePage.name);
                },
              );
            });
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
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      Texts.place,
                                      style: TextHelpers().titleQuote(),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        if (places != null)
                                          for (var place in places)
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        Texts.service,
                                        style: TextHelpers().titleQuote(),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        serviceSelected?.title ?? '',
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          height: 220,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 40, right: 20),
                                  child: Text(
                                    Texts.day,
                                    style: TextHelpers().titleQuote(),
                                  ),
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
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    Texts.hour,
                                    style: TextHelpers().titleQuote(),
                                  ),
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
                                          hintText: Texts
                                              .hour, //Validar si existe hora
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
                                          hintText: Texts
                                              .minute, //Validar si existe hora
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(Texts.observationConsiderer),
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              child: Text(Texts.schedule),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              PopupHelpers().popupTwoButtons(
                                context: context,
                                withIconClose: true,
                                title: Texts.needHelp,
                                description: Texts.needHelpText,
                                icon: null,
                                titleButtonOne: Texts.wa,
                                titleButtonTwo: Texts.call,
                                height: 220,
                                onPressedOne: () {
                                  FunctionsHelper().openWhatsApp();
                                },
                                onPressedTwo: () {
                                  launchUrlString(
                                    FunctionsHelper().numbrePhone(),
                                  );
                                },
                              );
                            },
                            child: Text(Texts.problemsScheduleQuote))
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
      errorQuote = Texts.pleaseSelectPlace;
    } else if (serviceSelected == null) {
      setState(() {});
      errorQuote = Texts.pleaseSelectService;
    } else if (daySelected.isEmpty) {
      setState(() {});
      errorQuote = Texts.pleaseSelectDayService;
    } else if (hourSelected.isEmpty || minutesSelected.isEmpty) {
      setState(() {});
      errorQuote = Texts.pleaseSelectHourService;
    } else {
      setState(() {});
      errorQuote = '';

      quoteBloc.add(
        CreteQuoteEvent(
          quote: Quote(
            place: placeSelected,
            service: serviceSelected,
            day: daySelected,
            hour: '$hourSelected:$minutesSelected $militarHour',
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
                  Text(
                    DateFormat('d').format(date),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('MMM').format(date),
                    style: const TextStyle(fontSize: 11),
                  ),
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
  final List<String> dataList;
  final String hintText;

  const _DropdownMenu({
    required this.onSelected,
    required this.dataList,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      hintText: hintText,
      onSelected: onSelected,
      dropdownMenuEntries:
          dataList.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(
          value: value,
          label: value,
        );
      }).toList(),
    );
  }
}
