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
    return '${dayWeekArray[dayWeek]}';
  }

  String getHoursOfDay(DateTime hour) {
    final now = DateTime.now();
    DateFormat.jm().format(now);
    return '';
  }

//Para mostrar fecha ordenada en el detail quote
  String dayToString(String day) {
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(day);
    return '${DatetimeHelper().getDayString(DateFormat('EEE').format(tempDate))} ${DateFormat('d').format(tempDate)} ${DateFormat('MMM').format(tempDate)}';
  }

  bool validateDateNow(String day, String hour) {
    DateTime tempDay = DateFormat("yyyy-MM-dd").parse(day);

    final newDay = '${tempDay.year}-${tempDay.month}-${tempDay.day}';
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm a").parse('$newDay $hour');

    if (tempDate.difference(DateTime.now()).inDays >= 0) return true;
    return false;
  }
}
