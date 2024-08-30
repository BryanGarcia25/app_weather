import 'package:app_weather/config/theme/scaffold_background.dart';
import 'package:app_weather/core/utils/colors.dart';
import 'package:app_weather/core/utils/convert_unix_to_date.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_bloc.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_event.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_state.dart';
import 'package:app_weather/weather/presentation/widgets/aditional_information.dart';
import 'package:app_weather/weather/presentation/widgets/current_weather.dart';
import 'package:app_weather/weather/presentation/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreen();
}

class _WeatherScreen extends State<WeatherScreen> {

  @override
  void initState() {
    BlocProvider.of<RemoteWeatherBloc>(context).add(OnGetWeather());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.orientationOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, size: 40, color: Colors.white),
            );
          }
        ),
        leadingWidth: 40,
      ),
      extendBodyBehindAppBar: true,
      // backgroundColor: const Color(0xFF131416),
      backgroundColor: backgroundColor(),
      body: BlocBuilder<RemoteWeatherBloc, RemoteWeatherState>(
        builder: (context, state) {
          switch (state) {
            case GetWeatherLoading():
              return const Center(child: CircularProgressIndicator());
            case GetWeatherInitial():
              return Center(
                child: orientation.name == "landscape" ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('lib/assets/storm.png', height: 250),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("App".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48, color: getColorByDayOrNight())),
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
                    )
                  ],
                ) : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('lib/assets/storm.png', height: 300),
                    const SizedBox(height: 20),
                    Text("App".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48, color: getColorByDayOrNight())),
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
            case GetWeatherForecastSuccess():
              return Container();
            case GetWeatherFailed():
              return const Text("Error al momento de consumir la API");
          }
        },
      ),
      drawer: const DrawerMenu(),
    );
  }
}