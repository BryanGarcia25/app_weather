import 'package:app_weather/config/icons/icons_weather.dart';
import 'package:app_weather/config/theme/linear_gradient_background.dart';
import 'package:app_weather/core/utils/convert_date.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_bloc.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_event.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_state.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RemoteWeatherBloc, RemoteWeatherState>(
        builder: (context, state) {
          switch (state) {
            case GetWeatherLoading():
              return const Center(child: CircularProgressIndicator());
            case GetWeatherInitial():
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Flexible(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Ciudad",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1
                                  )
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => BlocProvider.of<RemoteWeatherBloc>(context).add(OnGetWeatherForecastByCity()),
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
            case GetWeatherSuccess():
              return const Center(child: Text("Clima individual"));
            case GetWeatherForecastSuccess():
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Flexible(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Ciudad",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1
                                  )
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => BlocProvider.of<RemoteWeatherBloc>(context).add(OnGetWeatherForecastByCity()),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 225,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Pronóstico de clima", style: TextStyle(fontSize: 20)),
                            Expanded(
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
                                        gradient: linearGradientBackground()
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(getDate(state.weatherForecast.forecast[index]['dt_txt']), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                            Text(getHour(state.weatherForecast.forecast[index]['dt_txt']), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                            showIconsWeather(state.weatherForecast.forecast[index]['weather'][0]['icon'], 55),
                                            Text("${(state.weatherForecast.forecast[index]['main']['temp']  - 273.15).toString().split(".").first}°C", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
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
                      ),
                    ),
                  ],
                ),
              );
            case GetWeatherFailed():
              return const Center(child: Text("Fallo"));
          }
        }
      )
    );
  }
}