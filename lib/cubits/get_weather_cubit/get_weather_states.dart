class WeatherState {}

class WeatherInitialState extends WeatherState{}

class WeatherLoadedState extends WeatherState{}

class WeatherFailureState extends WeatherState{
  WeatherFailureState(this.errorMessage);

  final String errorMessage;
}
