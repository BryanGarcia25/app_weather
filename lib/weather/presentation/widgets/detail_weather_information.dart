import 'package:app_weather/core/utils/colors.dart';
import 'package:flutter/material.dart';

class DetailWeatherInformation extends StatelessWidget {
  const DetailWeatherInformation({
    super.key, this.period, required this.weatherInformation, required this.feacture, required this.icon,
  });
  final String? period;
  final IconData icon;
  final String weatherInformation;
  final String feacture;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: getColorByDayPeriod(period!)),
        Text(weatherInformation, style: TextStyle(fontWeight: FontWeight.bold, color: getColorByDayPeriod(period!))),
        Text(feacture, style: TextStyle(color: getColorByDayPeriod(period!))),
      ],
    );
  }
}