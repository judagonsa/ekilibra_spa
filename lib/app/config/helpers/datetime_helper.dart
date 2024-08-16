import 'package:intl/intl.dart';

class DatetimeHelper {
  List<DateTime> daysOfWeek() {
    List<DateTime> days = [];
    for (var i = 0; i < 7; i++) {
      days.add(DateTime.now().add(Duration(days: i)));
    }
    //remover sábado
    return days;
  }

  String dayString(DateTime date) {
    //devolver en español
    return DateFormat('EEEE, d').format(date);
  }
}
