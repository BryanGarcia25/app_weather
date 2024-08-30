import 'package:app_weather/core/error/failure.dart';
import 'package:app_weather/weather/domain/entity/weather.dart';
import 'package:app_weather/weather/domain/entity/weather_forecast.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeatherByCoordinates(double latitude, double longitude);
  Future<Either<Failure, WeatherForecast>> getWeatherForecastByCoordinates(double latitude, double longitude);
  Future<Either<Failure, WeatherForecast>> getWeatherByCityName(String cityName);
}