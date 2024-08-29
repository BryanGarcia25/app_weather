import 'package:flutter/material.dart';

Color getColorByDayPeriod(String period) {
  return period.contains('n') ? Colors.white : Colors.black;
}