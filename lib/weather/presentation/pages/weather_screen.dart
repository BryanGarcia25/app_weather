import 'package:app_weather/weather/presentation/BLoC/remote_weather_bloc.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_event.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RemoteWeatherBloc, RemoteWeatherState>(
        builder: (context, state) {
          switch (state) {
            case GetWeatherLoading():
                return const Center(child: CircularProgressIndicator());
            case GetWeatherInitial():
                return Center(child: TextButton(onPressed: () => BlocProvider.of<RemoteWeatherBloc>(context).add(OnGetWeather()), child: const Text("Comenzar")),);
            case GetWeatherSuccess():
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.weather.cityName),
                      Text(state.weather.main),
                      Text(state.weather.description),
                      Text("Nubes: ${state.weather.cloudPorcentage}%"),
                      Text("${state.weather.temp}°C"),
                      Text("Sensación termica: ${state.weather.feelsLike}°C"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text("Temperatura máxima: ${state.weather.tempMax}°C")
                          ),
                          SizedBox(
                            width: 100,
                            child: Text("Temperatura minima: ${state.weather.tempMin}°C")
                          ),
                        ],
                      ),
                      Text("Viento: ${state.weather.windSpeed} km/h"),
                      Text("Humedad: ${state.weather.humidity}%"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text("Salida del sol: ${state.weather.sunrise}")
                          ),
                          SizedBox(
                            width: 100,
                            child: Text("Puesta del sol: ${state.weather.sunset}")
                          ),
                        ],
                      ),
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