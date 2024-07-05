import 'package:app_weather/core/error/failure.dart';
import 'package:app_weather/weather/domain/entity/weather.dart';

sealed class RemoteWeatherState {}

final class GetWeatherInitial extends RemoteWeatherState {}

final class GetWeatherLoading extends RemoteWeatherState {}

final class GetWeatherSuccess extends RemoteWeatherState {
  final Weather weather;
  GetWeatherSuccess({required this.weather});
}

final class GetWeatherFailed extends RemoteWeatherState {
  final Failure failure;
  GetWeatherFailed({required this.failure});
}