import 'package:app_weather/weather/presentation/BLoC/remote_weather_bloc.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_event.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_state.dart';
import 'package:flutter/material.dart';
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
              return Center(child: Text(state.weatherForecast.cityName));
            case GetWeatherFailed():
              return const Center(child: Text("Fallo"));
          }
          // if (state is GetWeatherLoading) {
          //   return const Center(child: CircularProgressIndicator());
          // } else if (state is GetWeatherInitial) {
          //   return const Text("initial...");
          // } else if (state is GetWeatherSuccess) {
          //   return const Text("success...");
          // } else if (state is GetWeatherForecastSuccess) {
          //   return const Text("GetWeatherForecastSuccess...");
          // } else if (state is GetWeatherFailed) {
          //   return const Text("GetWeatherFailed...");
          // } else {
          //   return const SizedBox.shrink();
          // }
        }
      ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
      //   child: Column(
      //     children: [
      //       IntrinsicHeight(
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             const Flexible(
      //               child: TextField(
      //                 decoration: InputDecoration(
      //                   hintText: "Ciudad",
      //                   border: OutlineInputBorder(
      //                     borderSide: BorderSide(
      //                       width: 1
      //                     )
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             TextButton(
      //               onPressed: (){}, 
      //               style: TextButton.styleFrom(
      //                 backgroundColor: const Color(0xFF42dde6),
      //                 shape: BeveledRectangleBorder(
      //                   borderRadius: BorderRadius.circular(0)
      //                 ),
      //                 padding: const EdgeInsets.symmetric(horizontal: 20)
      //               ),
      //               child: const Text("Buscar", style: TextStyle(color: Colors.black, fontSize: 16)),
      //             )
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}