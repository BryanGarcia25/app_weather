import 'package:app_weather/core/error/failure.dart';
import 'package:app_weather/weather/domain/entity/weather_forecast.dart';
import 'package:app_weather/weather/domain/repositoy/weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetWeatherForecastByCityNameUseCase {
  final WeatherRepository weatherRepository;
  GetWeatherForecastByCityNameUseCase({required this.weatherRepository});

  Future<Either<Failure, WeatherForecast>> call(String cityName) {
    return weatherRepository.getWeatherForecastByCityName(cityName);
  }

}