import 'package:app_weather/config/icons/icons_weather.dart';
import 'package:app_weather/config/theme/linear_gradient_card.dart';
import 'package:app_weather/core/utils/colors.dart';
import 'package:app_weather/core/utils/convert_date.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_bloc.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_event.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_state.dart';
import 'package:app_weather/weather/presentation/widgets/current_weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherByCity extends StatefulWidget {
  const WeatherByCity({super.key});

  @override
  State<WeatherByCity> createState() => _WeatherByCityState();
}


class _WeatherByCityState extends State<WeatherByCity> {

  @override
  void initState() {
    BlocProvider.of<RemoteWeatherBloc>(context).add(ResetWeatherState());
    super.initState();
  }

  final controllerCity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RemoteWeatherBloc>(context).add(ResetWeatherState());
    Orientation orientation = MediaQuery.orientationOf(context);
    return BlocBuilder<RemoteWeatherBloc, RemoteWeatherState>(
      builder: (context, state) {
        if (state is GetWeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetWeatherInitial) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        child: TextField(
                          controller: controllerCity,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            hintText: "Ciudad",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1
                              )
                            ),
                            filled: true,
                            fillColor: Colors.white
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => BlocProvider.of<RemoteWeatherBloc>(context).add(OnGetWeatherByCity(city: controllerCity.text.trim())),
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFF42dde6),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(0)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20)
                        ),
                        child: const Text("Buscar", style: TextStyle(color: Colors.black, fontSize: 16)),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else if (state is GetWeatherAndForecastByCityName) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: SingleChildScrollView(
              child: orientation.name != "landscape" ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            child: TextField(
                              controller: controllerCity,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                hintText: "Ciudad",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1
                                  )
                                ),
                                filled: true,
                                fillColor: Colors.white
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => BlocProvider.of<RemoteWeatherBloc>(context).add(OnGetWeatherByCity(city: controllerCity.text.trim())),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF42dde6),
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(0)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 20)
                            ),
                            child: const Text("Buscar", style: TextStyle(color: Colors.black, fontSize: 16)),
                          )
                        ],
                      ),
                    ),
                    CurrentWeather(weather: state.weather, orientation: orientation.name),
                    const SizedBox(height: 20),
                    Text("Pronóstico de clima", style: TextStyle(fontSize: 20, color: getColorByDayOrNight())),
                    SizedBox(
                      height: 175,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.weatherForecast.forecast.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10),
                                gradient: linearGradientCard(state.weatherForecast.forecast[index]['weather'][0]['icon'].toString())
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(getDate(state.weatherForecast.forecast[index]['dt_txt']), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: getColorByDayPeriod(state.weatherForecast.forecast[index]['weather'][0]['icon'].toString()))),
                                    Text(getHour(state.weatherForecast.forecast[index]['dt_txt']), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: getColorByDayPeriod(state.weatherForecast.forecast[index]['weather'][0]['icon'].toString()))),
                                    showIconsWeather(state.weatherForecast.forecast[index]['weather'][0]['icon'], 55),
                                    Text("${(state.weatherForecast.forecast[index]['main']['temp']  - 273.15).toString().split(".").first}°C", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: getColorByDayPeriod(state.weatherForecast.forecast[index]['weather'][0]['icon'].toString())))
                                  ],
                                ),
                              )
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ) : Padding(
                padding: const EdgeInsets.only(top: 25, right: 15, left: 15),
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Flexible(
                            child: TextField(
                              controller: controllerCity,
                              style: const TextStyle(color: Colors.black),
                              decoration: const InputDecoration(
                                hintText: "Ciudad",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1
                                  )
                                ),
                                filled: true,
                                fillColor: Colors.white
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => BlocProvider.of<RemoteWeatherBloc>(context).add(OnGetWeatherByCity(city: controllerCity.text)),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF42dde6),
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(0)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 20)
                            ),
                            child: const Text("Buscar", style: TextStyle(color: Colors.black, fontSize: 16)),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                          CurrentWeather(weather: state.weather, orientation: orientation.name),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: Column(
                              children: [
                                Text("Pronóstico de clima", style: TextStyle(fontSize: 16, color: getColorByDayOrNight())),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.5,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.weatherForecast.forecast.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.transparent),
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: linearGradientCard(state.weatherForecast.forecast[index]['weather'][0]['icon'].toString())
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(getDate(state.weatherForecast.forecast[index]['dt_txt']), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: getColorByDayPeriod(state.weatherForecast.forecast[index]['weather'][0]['icon'].toString()))),
                                              const SizedBox(height: 10),
                                              Text(getHour(state.weatherForecast.forecast[index]['dt_txt']), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: getColorByDayPeriod(state.weatherForecast.forecast[index]['weather'][0]['icon'].toString()))),
                                              const SizedBox(height: 10),
                                              showIconsWeather(state.weatherForecast.forecast[index]['weather'][0]['icon'], 55),
                                              const SizedBox(height: 10),
                                              Text("${(state.weatherForecast.forecast[index]['main']['temp']  - 273.15).toString().split(".").first}°C", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: getColorByDayPeriod(state.weatherForecast.forecast[index]['weather'][0]['icon'].toString())))
                                            ],
                                          )
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (state is GetWeatherFailed) {
          return const Center(child: Text("Fallo"));
        } else {
          return const Center(child: Text("Otro evento"));
        }
        
      },
      buildWhen: (previous, current) => current is GetWeatherAndForecastByCityName,
    );
  }
}