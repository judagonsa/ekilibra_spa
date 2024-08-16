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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Servicio:'),
                  const SizedBox(width: 20),
                  DropdownMenu(
                    onSelected: (value) {
                      if (value != null) service = value;
                    },
                    dropdownMenuEntries:
                        services.map<DropdownMenuEntry<String>>((String value) {
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
                        .daysOfWeek()
                        .map<DropdownMenuEntry<String>>((DateTime value) {
                      final newValue = DatetimeHelper().dayString(value);
                      return DropdownMenuEntry<String>(
                          value: newValue, label: newValue);
                    }).toList(),
                  ),
                ],
              ),
              const Text('Seleccionar horas después de la actual'),
              const Text('Observaciones, un textbox'),
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
    );
  }

  _createQuote() {
    //validar items
  }
}
