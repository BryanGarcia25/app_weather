import 'package:app_weather/weather/domain/entity/weather_forecast.dart';

class WeatherForecastModel extends WeatherForecast {
  WeatherForecastModel({required super.cityName, required super.sunrise, required super.sunset, required super.forecast});

  factory WeatherForecastModel.fromJson(json) {
    return WeatherForecastModel(
      cityName: json['city']['name'],
      sunrise: json['city']['sunrise'],
      sunset: json['city']['sunset'],
      forecast: json['list']
    );
  }
}