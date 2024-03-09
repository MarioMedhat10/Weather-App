import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      /*
      * used Builder widget to get a new context that can have
      *   a GetWeatherCubit so it can use BlocProvider
      * */
      child: Builder(
        builder: (context) =>
            /*
            * putting BlocBuilder here is for rebuilding
            *  the color after searching
            * */
            BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    useMaterial3: false,
                    primarySwatch: getThemeColor(
                      BlocProvider
                          .of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition,
                    ),
                  ),
                  home: HomeScreen(),
                );
              },
            ),
      ),
    );
  }
}

/*
* we here made MaterialApp as a custom widget to solve the problem
*   that context doesn't contain a GetWeatherCubit so we need to extract it
*
* Or we can use Builder widget
* */
// class CustomMaterialApp extends StatelessWidget {
//   const CustomMaterialApp({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: false,
//         primarySwatch: getThemeColor(
//           BlocProvider.of<GetWeatherCubit>(context)
//               .weatherModel?.weatherCondition,
//         ),
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.grey;
  }
  switch (condition) {
    case "Sunny":
      return Colors.orange;
    case "Clear":
      return Colors.blue;
    case "Partly cloudy":
      return Colors.lightBlue;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.grey;
    case "Mist":
      return Colors.grey;
    case "Patchy rain possible":
      return Colors.lightBlue;
    case "Patchy snow possible":
      return Colors.grey;
    case "Patchy sleet possible":
      return Colors.grey;
    case "Patchy freezing drizzle possible":
      return Colors.grey;
    case "Thundery outbreaks possible":
      return Colors.amber;
    case "Fog":
      return Colors.grey;
    case "Freezing fog":
      return Colors.grey;
    case "Patchy light drizzle":
      return Colors.grey;
    case "Light drizzle":
      return Colors.grey;
    case "Freezing drizzle":
      return Colors.grey;
    case "Heavy freezing drizzle":
      return Colors.grey;
    case "Patchy light rain":
      return Colors.lightBlue;
    case "Light rain":
      return Colors.lightBlue;
    case "Moderate rain at times":
      return Colors.lightBlue;
    case "Moderate rain":
      return Colors.lightBlue;
    case "Heavy rain at times":
      return Colors.lightBlue;
    case "Heavy rain":
      return Colors.lightBlue;
    case "Light freezing rain":
      return Colors.grey;
    case "Moderate or heavy freezing rain":
      return Colors.grey;
    case "Light sleet":
      return Colors.grey;
    case "Moderate or heavy sleet":
      return Colors.grey;
    case "Patchy light snow":
      return Colors.grey;
    case "Light snow":
      return Colors.grey;
    case "Patchy moderate snow":
      return Colors.grey;
    case "Moderate snow":
      return Colors.grey;
    case "Patchy heavy snow":
      return Colors.grey;
    case "Heavy snow":
      return Colors.grey;
    case "Ice pellets":
      return Colors.grey;
    case "Light rain shower":
      return Colors.lightBlue;
    case "Moderate or heavy rain shower":
      return Colors.lightBlue;
    case "Torrential rain shower":
      return Colors.lightBlue;
    case "Light sleet showers":
      return Colors.grey;
    case "Moderate or heavy sleet showers":
      return Colors.grey;
    case "Light snow showers":
      return Colors.grey;
    case "Moderate or heavy snow showers":
      return Colors.grey;
    case "Light showers of ice pellets":
      return Colors.grey;
    case "Moderate or heavy showers of ice pellets":
      return Colors.grey;
    case "Patchy light rain with thunder":
      return Colors.amber;
    case "Moderate or heavy rain with thunder":
      return Colors.amber;
    case "Patchy light snow with thunder":
      return Colors.amber;
    case "Moderate or heavy snow with thunder":
      return Colors.amber;
    default:
      return Colors.grey;
  }
}
