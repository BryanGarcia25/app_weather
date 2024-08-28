import 'package:app_weather/core/error/failure.dart';
import 'package:app_weather/weather/data/data_sources/weather_remote_data.dart';
import 'package:app_weather/weather/domain/entity/weather.dart';
import 'package:app_weather/weather/domain/entity/weather_forecast.dart';
import 'package:app_weather/weather/domain/repositoy/weather_repository.dart';
import 'package:dartz/dartz.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteData weatherRemoteData;
  WeatherRepositoryImpl({required this.weatherRemoteData});

  @override
  Future<Either<Failure, Weather>> getWeatherByCityName(String cityName) async {
    try {
      final Weather resp = await weatherRemoteData.getWeatherByCityName(cityName);
      return Right(resp);
    } on ServerFailure {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Weather>> getWeatherByCoordinates(double latitude, double longitude) async {
    try {
      final Weather resp = await weatherRemoteData.getWeatherByCoordinates(latitude, longitude);
      return Right(resp);
    } on ServerFailure {
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, WeatherForecast>> getWeatherForecastByCoordinates(double latitude, double longitude) async {
    try {
      final WeatherForecast resp = await weatherRemoteData.getWeatherForecastByCoordinates(latitude, longitude);
      return Right(resp);
    } on ServerFailure {
      return Left(ServerFailure());
    }
  }
  
}