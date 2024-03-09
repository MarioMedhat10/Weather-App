import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/no_weather_screen.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather_info_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherScreen();
          } else if (state is WeatherLoadedState) {
            /*
            * here we need to put weatherModel object to make the widget
            *   non const so it can be rebuilt after every search
            * */
            return WeatherInfoScreen(
              weather: state.weatherModel,
            );
          } else {
            return Center(
              child: Text(
                'Oops, there was an error',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
