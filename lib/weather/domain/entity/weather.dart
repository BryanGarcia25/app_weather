class Weather {
  final String cityName;
  final String main;
  final String description;
  final double temp;
  final double feelsLike;
  final double tempMax;
  final double tempMin;
  final double humidity;
  final int visibility;
  final double windSpeed;
  final double? rain;
  final double cloudPorcentage;
  final double sunrise;
  final double sunset;

  Weather({required this.cityName, required this.main, required this.description, required this.temp, required this.feelsLike, required this.tempMax, required this.tempMin, required this.humidity, required this.visibility, required this.windSpeed, required this.rain, required this.cloudPorcentage, required this.sunrise, required this.sunset});
}