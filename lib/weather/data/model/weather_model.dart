import 'package:app_weather/weather/domain/entity/weather.dart';

class WeatherModel extends Weather {

  WeatherModel({required super.cityName, required super.main, required super.description, required super.temp, required super.feelsLike, required super.tempMax, required super.tempMin, required super.humidity, required super.visibility, required super.windSpeed, required super.rain, required super.cloudPorcentage, required super.sunrise, required super.sunset});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName : json['name'],
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