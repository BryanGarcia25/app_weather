import 'package:flutter/material.dart';

class DetailWeatherInformation extends StatelessWidget {
  const DetailWeatherInformation({
    super.key, required this.weatherInformation, required this.feacture, required this.icon,
  });
  final IconData icon;
  final String weatherInformation;
  final String feacture;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    return Column(
      children: [
        Icon(icon, color: date.hour < 6 || date.hour > 20 ? Colors.white : Colors.black),
        Text(weatherInformation, style: TextStyle(fontWeight: FontWeight.bold, color: date.hour < 6 || date.hour > 20 ? Colors.white : Colors.black)),
        Text(feacture, style: TextStyle(color: date.hour < 6 || date.hour > 20 ? Colors.white : Colors.black)),
      ],
    );
  }
}