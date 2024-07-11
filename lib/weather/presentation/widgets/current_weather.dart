import 'package:app_weather/config/icons/icons_weather.dart';
import 'package:app_weather/config/theme/linear_gradient_background.dart';
import 'package:app_weather/weather/domain/entity/weather.dart';
import 'package:app_weather/weather/presentation/widgets/detail_weather_information.dart';
import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    super.key, required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent
        ),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        gradient: linearGradientBackground(),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text("${date.day}/${date.month}/${date.year}", style: TextStyle(fontSize: 16, color: date.hour < 6 || date.hour > 20 ? Colors.white : Colors.black)),
          Text(weather.cityName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: date.hour < 6 || date.hour > 20 ? Colors.white : Colors.black)),
          const SizedBox(height: 10),
          showIconsWeather(weather.icon),
          const SizedBox(height: 10),
          Text("${weather.temp}°C", style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: date.hour < 6 || date.hour > 20 ? Colors.white : Colors.black)),
          Text(weather.description.toUpperCase(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: date.hour < 6 || date.hour > 20 ? Colors.white : Colors.black)),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent
              ),
              borderRadius: BorderRadius.circular(15),
              color: date.hour < 6 || date.hour > 20 ? const Color.fromARGB(255, 33, 61, 143) : const Color(0xFF99cef7)
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DetailWeatherInformation(icon: Icons.device_thermostat_sharp, feacture: "Sensación", weatherInformation: "${weather.feelsLike}°C"),
                  DetailWeatherInformation(icon: Icons.water_drop, feacture: "Humedad", weatherInformation: "${weather.humidity}%"),
                  DetailWeatherInformation(icon: Icons.air, feacture: "Viento", weatherInformation: "${weather.windSpeed} km/h"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}