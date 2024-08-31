abstract class RemoteWeatherEvent {
  
}

class OnGetWeather extends RemoteWeatherEvent {
  OnGetWeather();
}

class OnGetWeatherForecast extends RemoteWeatherEvent {
  
}

class OnGetWeatherForecastByCity extends RemoteWeatherEvent {
  final String city;

  OnGetWeatherForecastByCity({required this.city});
}

class ResetWeatherState extends RemoteWeatherEvent {}