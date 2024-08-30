import 'package:flutter/material.dart';

Color getColorByDayPeriod(String period) {
  return period.contains('n') ? Colors.white : Colors.black;
}

Color getColorByDayOrNight() {
  return DateTime.now().hour < 6 || DateTime.now().hour > 20 ? Colors.white : Colors.black;
}