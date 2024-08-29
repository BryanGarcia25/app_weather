import 'package:intl/intl.dart';

String getDate(String date) {
  return DateFormat('dd/MM/yyyy').format(DateTime.parse(date));
}

String getHour(String hour) {
  return DateTime.parse(hour).subtract(const Duration(hours: 6)).toString().split(' ')[1].split('.')[0];
}