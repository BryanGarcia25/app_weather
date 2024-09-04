import 'package:app_weather/config/icons/icons_weather.dart';
import 'package:app_weather/config/theme/linear_gradient_card.dart';
import 'package:app_weather/core/utils/colors.dart';
import 'package:app_weather/core/utils/convert_date.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_bloc.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_event.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_state.dart';
import 'package:app_weather/weather/presentation/widgets/detail_weather_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {

  @override
  void initState() {
    BlocProvider.of<RemoteWeatherBloc>(context).add(OnGetWeatherForecast());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RemoteWeatherBloc>(context).add(ResetWeatherState());
    return BlocBuilder<RemoteWeatherBloc, RemoteWeatherState>(
      builder: (context, state) {
        if (state is GetWeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetWeatherForecastSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: ListView.builder(
                itemCount: state.weatherForecast.forecast.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: linearGradientCard(state.weatherForecast.forecast[index]['weather'][0]['icon'])
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            Text("Clima para el día ${getDate(state.weatherForecast.forecast[index]['dt_txt'])} a las ${getHour(state.weatherForecast.forecast[index]['dt_txt'])}", style: TextStyle(color: getColorByDayPeriod(state.weatherForecast.forecast[index]['weather'][0]['icon'].toString()))),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 70,
                                  child: Text("${(state.weatherForecast.forecast[index]['main']['temp'] - 273.15).toString().split('.')[0]}°C", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: state.weatherForecast.forecast[index]['weather'][0]['icon'].toString().contains('n') ? Colors.white : Colors.black))
                                ),
                                SizedBox(
                                  width: 90,
                                  child: DetailWeatherInformation(period: state.weatherForecast.forecast[index]['weather'][0]['icon'], icon: Icons.water_drop, feacture: "Humedad", weatherInformation: "${state.weatherForecast.forecast[index]['main']['humidity']}%")
                                ),
                                SizedBox(
                                  width: 90,
                                  child: DetailWeatherInformation(period: state.weatherForecast.forecast[index]['weather'][0]['icon'], icon: Icons.air, feacture: "Viento", weatherInformation: "${state.weatherForecast.forecast[index]['wind']['speed']}km/h")
                                ),
                                SizedBox(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      showIconsWeather(state.weatherForecast.forecast[index]['weather'][0]['icon'], 60),
                                      Text("${state.weatherForecast.forecast[index]['weather'][0]['description']}", textAlign: TextAlign.center, style: TextStyle(color: getColorByDayPeriod(state.weatherForecast.forecast[index]['weather'][0]['icon'].toString())))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is GetWeatherFailed) {
          return const Center(child: Text("Fallo"));
        } else {
          return const Center(child: Text("Otro evento"));
        }
      },
      buildWhen: (previous, current) => current is GetWeatherForecastSuccess || current is GetWeatherLoading,
    );
  }
}