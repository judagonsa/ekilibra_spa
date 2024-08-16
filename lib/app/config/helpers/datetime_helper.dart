import 'package:intl/intl.dart';

class DatetimeHelper {
  //devolver en español
  //zona horaria colombiana
  List<DateTime> getDaysOfWeek() {
    List<DateTime> days = [];
    for (var i = 0; i < 7; i++) {
      days.add(DateTime.now().add(Duration(days: i)));
    }
    //remover sábado
    return days;
  }

  String getDayString(DateTime date) {
    return DateFormat('EEEE, d').format(date);
  }

//función para retornar las horas a partir de la actual, hasta las 6 pm cada hora o cada 30
}
