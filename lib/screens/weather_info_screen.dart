import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoScreen extends StatelessWidget {
  const WeatherInfoScreen({
    super.key, required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(weather.weatherCondition),
            getThemeColor(weather.weatherCondition)[300]!,
            getThemeColor(weather.weatherCondition)[50]!,
          ]
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                    'https:${weatherModel.image!}',
                ),
                Text(
                  weatherModel.temp.round().toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MaxTemp: ${weatherModel.maxTemp.round()}',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'MinTemp:  ${weatherModel.minTemp.round()}',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
