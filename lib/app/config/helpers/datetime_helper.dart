import 'package:intl/intl.dart';

class DatetimeHelper {
  //devolver en español
  //zona horaria colombiana
  List<DateTime> daysOfWeek() {
    List<DateTime> days = [];
    for (var i = 0; i < 7; i++) {
      days.add(DateTime.now().add(Duration(days: i)));
    }
    //remover sábado
    return days;
  }

  String dayString(DateTime date) {
    return DateFormat('EEEE, d').format(date);
  }
}
