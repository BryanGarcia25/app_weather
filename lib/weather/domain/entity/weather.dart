class Weather {
  final String cityName;
  final String icon;
  final String main;
  final String description;
  final int temp;
  final int feelsLike;
  final int tempMax;
  final int tempMin;
  final int humidity;
  final int visibility;
  final double windSpeed;
  final double? rain;
  final int cloudPorcentage;
  final int sunrise;
  final int sunset;

  Weather({required this.cityName, required this.icon, required this.main, required this.description, required this.temp, required this.feelsLike, required this.tempMax, required this.tempMin, required this.humidity, required this.visibility, required this.windSpeed, required this.rain, required this.cloudPorcentage, required this.sunrise, required this.sunset});
}