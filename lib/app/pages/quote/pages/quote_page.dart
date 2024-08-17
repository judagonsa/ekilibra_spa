import 'package:ekilibra_spa/app/config/helpers/button_helpers.dart';
import 'package:ekilibra_spa/app/config/helpers/datetime_helper.dart';
import 'package:flutter/material.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    String service;
    final List<String> services = ['Limpieza facial', 'masaje', 'camilla'];
    final List<String> places = ['Sogamoso', 'Duitama', 'Tunja'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar cita'),
      ),
      body: SafeArea(
        child: Expanded(
          child: Form(
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    const Text('Servicio:'),
                    const SizedBox(width: 20),
                    Expanded(
                      child: DropdownMenu(
                        errorText: 'Error',
                        onSelected: (value) {
                          if (value != null) service = value;
                        },
                        dropdownMenuEntries: services
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Lugar:'),
                    const SizedBox(width: 20),
                    DropdownMenu(
                      onSelected: (value) {
                        if (value != null) service = value;
                      },
                      dropdownMenuEntries:
                          places.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Día:'),
                    const SizedBox(width: 20),
                    DropdownMenu(
                      onSelected: (value) {
                        if (value != null) service = value;
                      },
                      dropdownMenuEntries: DatetimeHelper()
                          .getDaysOfWeek()
                          .map<DropdownMenuEntry<String>>((DateTime value) {
                        final newValue = DatetimeHelper().getDayString(value);
                        return DropdownMenuEntry<String>(
                            value: newValue, label: newValue);
                      }).toList(),
                    ),
                  ],
                ),
                const Text('Seleccionar horas después de la actual'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                const Spacer(),
                TextButton(
                  onPressed: () => _createQuote(),
                  style: ButtonHelpers().primaryButton(false),
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
