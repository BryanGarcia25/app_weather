import 'package:app_weather/weather/domain/entity/weather.dart';

class WeatherModel extends Weather {

  WeatherModel({required super.cityName, required super.main, required super.description, required super.temp, required super.feelsLike, required super.tempMax, required super.tempMin, required super.humidity, required super.visibility, required super.windSpeed, required super.rain, required super.cloudPorcentage, required super.sunrise, required super.sunset});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName : json['name'],
      main : json['weather'][0]['main'],
      description : json['weather'][0]['description'],
      temp : double.parse((json['main']['temp'] - 273.15).toString()).toInt(),
      feelsLike: double.parse((json['main']['feels_like'] - 273.15).toString()).toInt(),
      tempMax : double.parse((json['main']['temp_max'] - 273.15).toString()).toInt(),
      tempMin : double.parse((json['main']['temp_min'] - 273.15).toString()).toInt(),
      humidity : json['main']['humidity'],
      visibility : json['visibility'],
      windSpeed : json['wind']['speed'],
      rain : 0.0,
      cloudPorcentage : json['clouds']['all'],
      sunrise : json['sys']['sunrise'],
      sunset : json['sys']['sunset']
    );
  }
  
}