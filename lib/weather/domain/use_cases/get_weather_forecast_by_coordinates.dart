import 'package:app_weather/core/error/failure.dart';
import 'package:app_weather/weather/domain/entity/weather_forecast.dart';
import 'package:app_weather/weather/domain/repositoy/weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetWeatherForecastByCoordinatesUseCase {
  final WeatherRepository weatherRepository;
  GetWeatherForecastByCoordinatesUseCase({required this.weatherRepository});

  Future<Either<Failure, WeatherForecast>> call(double latitude, double longitude) {
    return weatherRepository.getWeatherForecastByCoordinates(latitude, longitude);
  }
}