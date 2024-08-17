import 'package:ekilibra_spa/app/config/helpers/button_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/datetime_helper.dart';
import 'package:flutter/material.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  String placeSelected = '';
  @override
  Widget build(BuildContext context) {
    String serviceSelected = '';

    final List<String> services = ['Limpieza facial', 'masaje', 'camilla'];
    // final List<String> places = ['Sogamoso', 'Duitama', 'Tunja']; ajustar más adelante

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
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      placeSelected = 'Sogamoso';
                                    });
                                  },
                                  style: ButtonHelpers().secondaryButton(
                                    textColor: placeSelected == 'Sogamoso'
                                        ? Colors.white
                                        : Colors.purple,
                                    borderColor: Colors.purple,
                                    backgrounColor: placeSelected == 'Sogamoso'
                                        ? Colors.purple
                                        : null,
                                  ),
                                  child: const Text('Sogamoso'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      placeSelected = 'Duitama';
                                    });
                                  },
                                  style: ButtonHelpers().secondaryButton(
                                      textColor: placeSelected == 'Duitama'
                                          ? Colors.white
                                          : Colors.purple,
                                      borderColor: Colors.purple,
                                      backgrounColor: placeSelected == 'Duitama'
                                          ? Colors.purple
                                          : null),
                                  child: const Text('Duitama'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      placeSelected = 'Tunja';
                                    });
                                  },
                                  style: ButtonHelpers().secondaryButton(
                                      textColor: placeSelected == 'Tunja'
                                          ? Colors.white
                                          : Colors.purple,
                                      borderColor: Colors.purple,
                                      backgrounColor: placeSelected == 'Tunja'
                                          ? Colors.purple
                                          : null),
                                  child: const Text('Tunja'),
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
                            const SizedBox(width: 20),
                            DropdownMenu(
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
                const SizedBox(height: 10),
                Container(
                  height: 170,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Día:'),
                            const SizedBox(width: 20),
                            DropdownMenu(
                              onSelected: (value) {
                                // if (value != null) service = value;
                              },
                              dropdownMenuEntries: DatetimeHelper()
                                  .getDaysOfWeek()
                                  .map<DropdownMenuEntry<String>>(
                                      (DateTime value) {
                                final newValue =
                                    DatetimeHelper().getDayString(value);
                                return DropdownMenuEntry<String>(
                                    value: newValue, label: newValue);
                              }).toList(),
                            ),
                          ],
                        ),
                        const Text('Seleccionar horas después de la actual'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
}
