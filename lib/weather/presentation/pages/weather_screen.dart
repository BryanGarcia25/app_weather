import 'package:app_weather/core/utils/convert_unix_to_date.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_bloc.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_event.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_state.dart';
import 'package:app_weather/weather/presentation/widgets/aditional_information.dart';
import 'package:app_weather/weather/presentation/widgets/current_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreen();
}

class _WeatherScreen extends State<WeatherScreen> {

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RemoteWeatherBloc>(context).add(OnGetWeather());
    Orientation orientation = MediaQuery.orientationOf(context);
    return BlocBuilder<RemoteWeatherBloc, RemoteWeatherState>(
      builder: (context, state) {
        if (state is GetWeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetWeatherSuccess) {
          return Center(
            child: orientation.name == "landscape" ? Row(
              children: [
                CurrentWeather(weather: state.weather, orientation: orientation.name),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AditionalInformation(icon: Icons.cloud, feacture: "Nubes", weatherInformation: "${state.weather.cloudPorcentage}%", orientation: orientation.name),
                    const SizedBox(height: 10),
                    AditionalInformation(icon: Icons.sunny, feacture: "Salida del sol", weatherInformation: convertUnitTimeToDate(state.weather.sunrise * 1000), orientation: orientation.name),
                    const SizedBox(height: 10),
                    AditionalInformation(icon: Icons.nightlight, feacture: "Puesta del sol", weatherInformation: convertUnitTimeToDate(state.weather.sunset * 1000), orientation: orientation.name),
                  ],
                )
              ],
            ) : Column(
              children: [
                CurrentWeather(weather: state.weather, orientation: orientation.name),
                const SizedBox(height: 20),
                AditionalInformation(icon: Icons.cloud, feacture: "Nubes", weatherInformation: "${state.weather.cloudPorcentage}%", orientation: orientation.name),
                const SizedBox(height: 10),
                AditionalInformation(icon: Icons.sunny, feacture: "Salida del sol", weatherInformation: convertUnitTimeToDate(state.weather.sunrise * 1000), orientation: orientation.name),
                const SizedBox(height: 10),
                AditionalInformation(icon: Icons.nightlight, feacture: "Puesta del sol", weatherInformation: convertUnitTimeToDate(state.weather.sunset * 1000), orientation: orientation.name),
              ],
            ),
          );
        } else if (state is GetWeatherFailed) {
          return const Center(child: Text("Fallo"));
        } else {
          return const Center(child: Text("Otro evento"));
        }
      },
      buildWhen: (previous, current) => current is GetWeatherLoading || current is GetWeatherSuccess || current is GetWeatherFailed,
    );
  }
}