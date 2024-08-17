import 'package:intl/intl.dart';

class DatetimeHelper {
  //devolver en español
  //zona horaria colombiana
  List<DateTime> getDaysOfWeek() {
    List<DateTime> days = [];
    for (var i = 0; i < 7; i++) {
      if (DateTime.now().add(Duration(days: i)).weekday != 6) {
        days.add(DateTime.now().add(Duration(days: i)));
      }
    }
    return days;
  }

  String getDayString(DateTime date) {
    final Map<String, String> dayWeekArray = {
      'Monday': 'Lunes',
      'Tuesday': 'Martes',
      'Wednesday': 'Miércoles',
      'Thursday': 'Jueves',
      'Friday': 'Viernes',
      'Sunday': 'Domingo',
    };
    final dayOfWeek = DateFormat('EEEE').format(date);
    final numberOfWeek = DateFormat('d').format(date);
    // getHoursOfDay();
    return '${dayWeekArray[dayOfWeek]}, $numberOfWeek';
  }

  String getHoursOfDay() {
    final now = DateTime.now();
    // final now2 = DateFormat("h:mma").format(now);
    DateFormat.jm().format(now);
    return '';
  }

//función para retornar las horas a partir de la actual, hasta las 6 pm cada hora o cada 30
}
