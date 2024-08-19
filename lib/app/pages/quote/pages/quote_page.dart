import 'package:ekilibra_spa/app/config/helpers/button_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/datetime_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  String placeSelected = '';
  DateTime? dateSelected;
  TimeOfDay? hourSelected;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String serviceSelected = '';

    final List<String> services = ['Limpieza facial', 'masaje', 'camilla'];
    final List<String> places = ['Sogamoso', 'Duitama', 'Tunja'];

    final localizations = MaterialLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 215, 216),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Agendar cita'),
      ),
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Spacer(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Servicio:'),
                            DropdownMenu(
                              width: 250,
                              // errorText: 'Error',
                              onSelected: (value) {
                                if (value != null) serviceSelected = value;
                              },
                              dropdownMenuEntries: services
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
                                return DropdownMenuEntry<String>(
                                  value: value,
                                  label: value,
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text('Día:'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var dateWeek
                                in DatetimeHelper().getDaysOfWeek())
                              _DaysWeek(
                                date: dateWeek,
                                dateSelected: dateSelected,
                                action: () {
                                  setState(() {
                                    dateSelected = dateWeek;
                                  });
                                },
                              )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text('Hora:'),
                        ),
                        if (hourSelected == null)
                          TextButton(
                            onPressed: _selectedHour,
                            style: ButtonHelpers().secondaryButton(
                              textColor: Colors.purple,
                              borderColor: Colors.purple,
                            ),
                            child: const Text('Seleccionar hora'),
                          ),
                        if (hourSelected != null)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                localizations.formatTimeOfDay(hourSelected!),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 45,
                                child: TextButton(
                                  onPressed: _selectedHour,
                                  style: ButtonHelpers().secondaryButton(
                                    textColor: Colors.purple,
                                    borderColor: Colors.purple,
                                  ),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
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
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => _createQuote(),
                  style: ButtonHelpers().primaryButton(
                    isLogin: false,
                    backgroundColor: Colors.purple,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Text('Agendar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _createQuote() {
    //validar items
  }
  Future<void> _selectedHour() async {
    TimeOfDay? pickerHour = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickerHour != null) {
      setState(() {
        hourSelected = pickerHour;
      });
    }
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
