String convertUnitTimeToDate(int unixTime) {
  return "${_getHour(unixTime)}:${_getMinutes(unixTime)}:${_getSeconds(unixTime)}";
}

String _getHour(int hour) {
  return DateTime.fromMillisecondsSinceEpoch(hour).hour < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(hour).hour}" : "${DateTime.fromMillisecondsSinceEpoch(hour).hour}";
}

String _getMinutes(int minutes) {
  return DateTime.fromMillisecondsSinceEpoch(minutes).minute < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(minutes).minute}" : "${DateTime.fromMillisecondsSinceEpoch(minutes).minute}";
}

String _getSeconds(int seconds) {
  return DateTime.fromMillisecondsSinceEpoch(seconds).second < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(seconds).second}" : "${DateTime.fromMillisecondsSinceEpoch(seconds).second}";
}