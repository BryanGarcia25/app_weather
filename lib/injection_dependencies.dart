import 'package:app_weather/weather/data/data_sources/weather_remote_data.dart';
import 'package:app_weather/weather/data/repository/weather_repository_impl.dart';
import 'package:app_weather/weather/domain/repositoy/weather_repository.dart';
import 'package:app_weather/weather/domain/use_cases/get_weather_by_city.dart';
import 'package:app_weather/weather/domain/use_cases/get_weather_by_coordinates.dart';
import 'package:app_weather/weather/domain/use_cases/get_weather_forecast_by_city.dart';
import 'package:app_weather/weather/domain/use_cases/get_weather_forecast_by_coordinates.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_bloc.dart';
import 'package:get_it/get_it.dart';

final getItInstance = GetIt.instance;

Future<void> initializeDependencies() async {
  getItInstance.registerFactory(() => RemoteWeatherBloc(getItInstance(), getItInstance(), getItInstance(), getItInstance()));

  getItInstance.registerLazySingleton(() => GetWeatherByCityNameUseCase(weatherRepository: getItInstance()));
  getItInstance.registerLazySingleton(() => GetWeatherForecastByCityNameUseCase(weatherRepository: getItInstance()));
  getItInstance.registerLazySingleton(() => GetWeatherByCoordinatesUseCase(weatherRepository: getItInstance()));
  getItInstance.registerLazySingleton(() => GetWeatherForecastByCoordinatesUseCase(weatherRepository: getItInstance()));
  
  getItInstance.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(weatherRemoteData: getItInstance()));

  getItInstance.registerLazySingleton<WeatherRemoteData>(() => WeatherRemoteDataImpl());
}