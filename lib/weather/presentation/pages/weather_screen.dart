import 'package:app_weather/config/theme/scaffold_background.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_bloc.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_event.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_state.dart';
import 'package:app_weather/weather/presentation/widgets/aditional_information.dart';
import 'package:app_weather/weather/presentation/widgets/current_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String sunset = "";

    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: const Color(0xFF131416),
      backgroundColor: backgroundColor(sunset),
      body: BlocBuilder<RemoteWeatherBloc, RemoteWeatherState>(
        builder: (context, state) {
          switch (state) {
            case GetWeatherLoading():
              return const Center(child: CircularProgressIndicator());
            case GetWeatherInitial():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('lib/assets/storm.png', height: 300),
                    const SizedBox(height: 20),
                    Text("App".toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 48, color: Colors.black)),
                    Text("Weather".toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 48, color: Color(0xFF42dde6))),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => BlocProvider.of<RemoteWeatherBloc>(context).add(OnGetWeather()),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF42dde6),
                        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                      child: const Text("Comenzar", style: TextStyle(color: Colors.black, fontSize: 26)),
                    ),
                  ],
                ),
              );
            case GetWeatherSuccess():
              return Center(
                child: Column(
                  children: [
                    CurrentWeather(weather: state.weather),
                    const SizedBox(height: 20),
                    AditionalInformation(icon: Icons.cloud, feacture: "Nubes", weatherInformation: "${state.weather.cloudPorcentage}%"),
                    const SizedBox(height: 10),
                    AditionalInformation(icon: Icons.sunny, feacture: "Salida del Sol", weatherInformation: "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).hour < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).hour}" : "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).hour}"}:${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).minute < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).minute}" : "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).minute}"}:${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).second < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).second}" : "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).second}"}"),
                    const SizedBox(height: 10),
                    AditionalInformation(icon: Icons.nightlight, feacture: "Puesta del Sol", weatherInformation: "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).hour}:${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).minute}:${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).second < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).second}" : "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).second}"}"),
                  ],
                ),
              );
            case GetWeatherFailed():
              return const Text("Error al momento de consumir la API");
          }
        },
      ),
    );
  }
}