import 'package:app_weather/core/constants/constants.dart';
import 'package:app_weather/weather/data/model/weather_forecast_model.dart';
import 'package:app_weather/weather/data/model/weather_model.dart';
import 'package:dio/dio.dart';

abstract class WeatherRemoteData {
  Future<WeatherModel> getWeatherByCityName(String cityName);
  Future<WeatherModel> getWeatherByCoordinates(double latitude, double longitude);
  Future<WeatherForecastModel> getWeatherForecastByCoordinates(double latitude, double longitude);
}

class WeatherRemoteDataImpl implements WeatherRemoteData {
  final Dio dio = Dio();

  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async {
    final respApi = await dio.get('$weatherBaseUrl$cityName&appid=$weatherApiKey');
    return WeatherModel.fromJson(respApi.data);
  }
  
  @override
  Future<WeatherModel> getWeatherByCoordinates(double latitude, double longitude) async {
    final respApi = await dio.get('${weatherBaseUrl}lat=$latitude&lon=$longitude&appid=$weatherApiKey');
    return WeatherModel.fromJson(respApi.data);
  }
  
  @override
  Future<WeatherForecastModel> getWeatherForecastByCoordinates(double latitude, double longitude) async {
    final respWeatherForecastApi = await dio.get('${weatherForecastBaseUrl}lat=$latitude&lon=$longitude&appid=$weatherApiKey');
    return WeatherForecastModel.fromJson(respWeatherForecastApi.data);
  }
  
}