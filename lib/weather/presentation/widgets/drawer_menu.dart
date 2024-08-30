import 'package:app_weather/weather/presentation/pages/weather_by_city.dart';
import 'package:app_weather/weather/presentation/pages/weather_forecast_screen.dart';
import 'package:app_weather/weather/presentation/pages/weather_screen.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF42dde6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: ListView(
          children: [
            ListTile(
              title: const Row(
                children: [
                  SizedBox(
                    height: 40,
                    child: Icon(Icons.location_city, size: 32,)
                  ),
                  SizedBox(width: 20),
                  Text("Clima actual", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), 
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WeatherScreen()));
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  SizedBox(
                    height: 40,
                    child: Icon(Icons.access_time_filled, size: 32,)
                  ),
                  SizedBox(width: 20),
                  Text("Pronostico del clima", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), 
                ],
              ),
              // onTap: () => BlocProvider.of<RemoteWeatherBloc>(context).add(OnGetWeatherForecast()),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WeatherForecastScreen()));
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  SizedBox(
                    height: 40,
                    child: Icon(Icons.search, size: 32,)
                  ),
                  SizedBox(width: 20),
                  Text("Buscar ciudad", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WeatherByCity()));
              },
            ),
          ],
        ),
      ),
    );
  }
}