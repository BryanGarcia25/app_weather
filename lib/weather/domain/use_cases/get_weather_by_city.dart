import 'package:app_weather/core/error/failure.dart';
import 'package:app_weather/weather/domain/entity/weather_forecast.dart';
import 'package:app_weather/weather/domain/repositoy/weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetWeatherByCityNameUseCase {
  final WeatherRepository weatherRepository;
  GetWeatherByCityNameUseCase({required this.weatherRepository});

  Future<Either<Failure, WeatherForecast>> call(String cityName) {
    return weatherRepository.getWeatherByCityName(cityName);
  }

}