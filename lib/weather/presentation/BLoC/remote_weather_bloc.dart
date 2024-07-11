import 'package:app_weather/weather/domain/use_cases/get_weather_by_city.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_event.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteWeatherBloc extends Bloc<RemoteWeatherEvent, RemoteWeatherState> {
  final GetWeatherByCityNameUseCase _getWeatherByCityNameUseCase;

  RemoteWeatherBloc(this._getWeatherByCityNameUseCase) : super(GetWeatherInitial()) {
    on<OnGetWeather>((event, emit) async {
      emit(GetWeatherLoading());
      final respApiByCity = await _getWeatherByCityNameUseCase('Ciudad de Mexico');
      respApiByCity.fold((f) => GetWeatherFailed(failure: f), (w) => emit(GetWeatherSuccess(weather: w)));
    });
  }
}