import 'package:app_weather/weather/domain/entity/weather.dart';

class WeatherForecastModel extends Weather {

  WeatherForecastModel({required super.cityName, required super.icon, required super.main, required super.description, required super.temp, required super.feelsLike, required super.tempMax, required super.tempMin, required super.humidity, required super.visibility, required super.windSpeed, required super.rain, required super.cloudPorcentage, required super.sunrise, required super.sunset});

  factory WeatherForecastModel.fromJson(json) {
    return WeatherForecastModel(
      cityName : json['city']['name'],
      icon: json['weather'][0]['icon'],
      main : json['weather']['main'],
      description : json['weather']['description'],
      temp : json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      tempMax : json['main']['tempMax'],
      tempMin : json['main']['tempMin'],
      humidity : json['main']['humidity'],
      visibility : json['visibility'],
      windSpeed : json['wind']['speed'],
      rain : json['rain']['1h'],
      cloudPorcentage : json['clouds']['all'],
      sunrise : json['sys']['sunrise'],
      sunset : json['sys']['sunset']
    );
  }
  
}