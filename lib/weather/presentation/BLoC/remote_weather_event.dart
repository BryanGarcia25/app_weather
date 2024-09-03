abstract class RemoteWeatherEvent {
  
}

class OnGetWeather extends RemoteWeatherEvent {
  OnGetWeather();
}

class OnGetWeatherForecast extends RemoteWeatherEvent {
  
}

class OnGetWeatherByCity extends RemoteWeatherEvent {
  final String city;

  OnGetWeatherByCity({required this.city});
}

class ResetWeatherState extends RemoteWeatherEvent {}