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
    DateTime date = DateTime.now();
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
                        Text("App".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48, color: date.hour < 6 || date.hour > 20 ? Colors.white : Colors.black)),
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
                    Text("App".toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48, color: date.hour < 6 || date.hour > 20 ? Colors.white : Colors.black)),
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
                        AditionalInformation(icon: Icons.sunny, feacture: "Salida del Sol", weatherInformation: "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).hour < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).hour}" : "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).hour}"}:${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).minute < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).minute}" : "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).minute}"}:${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).second < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).second}" : "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).second}"}", orientation: orientation.name),
                        const SizedBox(height: 10),
                        AditionalInformation(icon: Icons.nightlight, feacture: "Puesta del Sol", weatherInformation: "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).hour}:${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).minute}:${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).second < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).second}" : "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).second}"}", orientation: orientation.name),
                      ],
                    )
                  ],
                ) : Column(
                  children: [
                    CurrentWeather(weather: state.weather, orientation: orientation.name),
                    const SizedBox(height: 20),
                    AditionalInformation(icon: Icons.cloud, feacture: "Nubes", weatherInformation: "${state.weather.cloudPorcentage}%", orientation: orientation.name),
                    const SizedBox(height: 10),
                    AditionalInformation(icon: Icons.sunny, feacture: "Salida del Sol", weatherInformation: "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).hour < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).hour}" : "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).hour}"}:${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).minute < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).minute}" : "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).minute}"}:${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).second < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).second}" : "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunrise * 1000).second}"}", orientation: orientation.name),
                    const SizedBox(height: 10),
                    AditionalInformation(icon: Icons.nightlight, feacture: "Puesta del Sol", weatherInformation: "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).hour}:${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).minute}:${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).second < 10 ? "0${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).second}" : "${DateTime.fromMillisecondsSinceEpoch(state.weather.sunset * 1000).second}"}", orientation: orientation.name),
                  ],
                ),
              );
            case GetWeatherFailed():
              return const Text("Error al momento de consumir la API");
          }
        },
      ),
      drawer: Drawer(
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
                      child: Icon(Icons.location_city)
                    ),
                    SizedBox(width: 20),
                    Text("Clima Actual", style: TextStyle(color: Colors.white)), 
                  ],
                ),
                onTap: () {
                  
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Icon(Icons.access_time_filled)
                    ),
                    SizedBox(width: 20),
                    Text("Clima en los próximos días", style: TextStyle(color: Colors.white)), 
                  ],
                ),
                onTap: () {
                  
                },
              ),
              ListTile(
                title: const Row(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Icon(Icons.search)
                    ),
                    SizedBox(width: 20),
                    Text("Buscar ciudad", style: TextStyle(color: Colors.white)),
                  ],
                ),
                onTap: () {
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}