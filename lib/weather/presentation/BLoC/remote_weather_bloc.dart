import 'package:app_weather/core/resources/get_position.dart';
import 'package:app_weather/weather/domain/use_cases/get_weather_by_coordinates.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_event.dart';
import 'package:app_weather/weather/presentation/BLoC/remote_weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class RemoteWeatherBloc extends Bloc<RemoteWeatherEvent, RemoteWeatherState> {
  final GetWeatherByCoordinatesUseCase _getWeatherByCoordinatesUseCase;

  RemoteWeatherBloc(this._getWeatherByCoordinatesUseCase) : super(GetWeatherInitial()) {
    on<OnGetWeather>((event, emit) async {
      emit(GetWeatherLoading());

      GetCurrentPosition getCurrentPosition = GetCurrentPosition();
      Position position = await getCurrentPosition.getPositions();

      final respApiByCoordinates = await _getWeatherByCoordinatesUseCase(position.latitude, position.longitude);
      respApiByCoordinates.fold((f) => GetWeatherFailed(failure: f), (w) => emit(GetWeatherSuccess(weather: w)));
    });
  }
}