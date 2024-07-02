import 'package:app_weather/core/error/failure.dart';
import 'package:app_weather/weather/domain/entity/weather.dart';
import 'package:app_weather/weather/domain/repositoy/weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetWeatherByCoordinatesUseCase {
  final WeatherRepository weatherRepository;
  GetWeatherByCoordinatesUseCase({required this.weatherRepository});

  Future<Either<Failure, Weather>> call(double latitude, double longitude) {
    return weatherRepository.getWeatherByCoordinates(latitude, longitude);
  }

}