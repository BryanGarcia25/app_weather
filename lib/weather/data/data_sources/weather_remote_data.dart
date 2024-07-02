import 'package:app_weather/core/constants/constants.dart';
import 'package:app_weather/weather/data/model/weather_model.dart';
import 'package:app_weather/weather/domain/entity/weather.dart';
import 'package:dio/dio.dart';

abstract class WeatherRemoteData {
  Future<WeatherModel> getWeatherByCityName(String cityName);
  Future<Weather> getWeatherByCoordinates(double latitude, double longitude);
}

class WeatherRemoteDataImpl implements WeatherRemoteData {
  final Dio dio = Dio();

  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async {
    final respApi = await dio.get('$weatherBaseUrl$cityName&appid=$weatherApiKey');
    return WeatherModel.fromJson(respApi);
  }
  
  @override
  Future<Weather> getWeatherByCoordinates(double latitude, double longitude) async {
    final respApi = await dio.get('${weatherCoordinatesBaseUrl}lat=$latitude&lon=$longitude&appid=$weatherApiKey');
    return WeatherModel.fromJson(respApi);
  }
  
}