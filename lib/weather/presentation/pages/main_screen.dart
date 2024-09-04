import 'package:app_weather/config/theme/scaffold_background.dart';
import 'package:app_weather/weather/presentation/pages/weather_by_city.dart';
import 'package:app_weather/weather/presentation/pages/weather_forecast_screen.dart';
import 'package:app_weather/weather/presentation/pages/weather_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

  int selectedIndex = 0;
  final screens = [const WeatherScreen(), const WeatherForecastScreen(), const WeatherByCity()];

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        // type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.location_on_outlined),
            activeIcon: const Icon(Icons.location_on),
            label: "Clima",
            backgroundColor: Theme.of(context).colorScheme.primary
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.wb_sunny_outlined),
            activeIcon: const Icon(Icons.sunny),
            label: "Pronóstico",
            backgroundColor: Theme.of(context).colorScheme.primary
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            activeIcon: const Icon(Icons.search_outlined),
            label: "Buscar",
            backgroundColor: Theme.of(context).colorScheme.primary
          )
        ]
      ),
    );
  }
}