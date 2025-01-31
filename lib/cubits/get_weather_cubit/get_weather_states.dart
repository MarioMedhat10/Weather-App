import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  WeatherSuccessState(this.weatherModel);

  final WeatherModel weatherModel;
}

class WeatherFailureState extends WeatherState {
  WeatherFailureState(this.errorMessage);

  final String errorMessage;
}
