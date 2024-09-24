import 'package:intl/intl.dart';

class DatetimeHelper {
  //devolver en español
  //zona horaria colombiana
  List<DateTime> getDaysOfWeek() {
    List<DateTime> days = [];
    for (var i = 1; i <= 7; i++) {
      if (DateTime.now().add(Duration(days: i)).weekday != 6) {
        days.add(DateTime.now().add(Duration(days: i)));
      }
    }
    return days;
  }

  String getDayString(String dayWeek) {
    final Map<String, String> dayWeekArray = {
      'Mon': 'Lun',
      'Tue': 'Mar',
      'Wed': 'Mié',
      'Thu': 'Jue',
      'Fri': 'Vie',
      'Sun': 'Dom',
    };
    // getHoursOfDay();
    return '${dayWeekArray[dayWeek]}';
  }

  String getHoursOfDay(DateTime hour) {
    final now = DateTime.now();
    DateFormat.jm().format(now);
    return '';
  }
}
