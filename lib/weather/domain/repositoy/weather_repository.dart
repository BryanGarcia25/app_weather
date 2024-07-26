import 'package:app_weather/core/error/failure.dart';
import 'package:app_weather/weather/domain/entity/weather.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeatherByCoordinates(double latitude, double longitude);
  Future<Either<Failure, Weather>> getWeatherForecastByCoordinates(double latitude, double longitude);
  Future<Either<Failure, Weather>> getWeatherByCityName(String cityName);
}