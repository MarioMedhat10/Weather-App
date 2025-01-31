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
                  home: const HomeScreen(),
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
      return Colors.orange; // Bright and warm for sunny weather
    case "Partly cloudy":
      return Colors.blue; // Soft blue for mixed clouds
    case "Cloudy":
      return Colors.grey; // Neutral grey for overcast
    case "Overcast":
      return Colors.blueGrey; // Darker grey for heavy clouds
    case "Mist":
      return Colors.teal; // Soft, hazy feel
    case "Patchy rain possible":
      return Colors.lightBlue; // Light blue for gentle rain
    case "Patchy snow possible":
      return Colors.blue; // Cool blue for snow
    case "Patchy sleet possible":
      return Colors.cyan; // Icy color for sleet
    case "Patchy freezing drizzle possible":
      return Colors.indigo; // Dark icy color
    case "Thundery outbreaks possible":
      return Colors.deepPurple; // Intense purple for storms
    case "Blowing snow":
      return Colors.blue; // Bright icy blue
    case "Blizzard":
      return Colors.grey; // Grey for heavy snow
    case "Fog":
      return Colors.grey; // Dull grey for low visibility
    case "Freezing fog":
      return Colors.blueGrey; // Colder fog
    case "Patchy light drizzle":
      return Colors.blue; // Light blue for drizzle
    case "Light drizzle":
      return Colors.lightBlue; // Slightly lighter blue
    case "Freezing drizzle":
      return Colors.cyan; // Icy blue for freezing drizzle
    case "Heavy freezing drizzle":
      return Colors.teal; // More intense icy blue
    case "Patchy light rain":
      return Colors.blue; // Bright blue for light rain
    case "Light rain":
      return Colors.blue; // Soft blue
    case "Moderate rain at times":
      return Colors.indigo; // Deeper blue
    case "Moderate rain":
      return Colors.indigo; // Solid blue for moderate rain
    case "Heavy rain at times":
      return Colors.blueGrey; // Dark blue for heavy rain
    case "Heavy rain":
      return Colors.indigo; // Intense stormy feel
    case "Light freezing rain":
      return Colors.cyan; // Icy tone
    case "Moderate or heavy freezing rain":
      return Colors.teal; // Deep cold feel
    case "Light sleet":
      return Colors.lightBlue; // Gentle icy mix
    case "Moderate or heavy sleet":
      return Colors.cyan; // Intense sleet
    case "Patchy light snow":
      return Colors.blueGrey; // Soft grey-blue
    case "Light snow":
      return Colors.grey; // Pure white feel
    case "Patchy moderate snow":
      return Colors.grey; // Deeper grey-blue
    case "Moderate snow":
      return Colors.blueGrey; // Deep blue-grey
    case "Patchy heavy snow":
      return Colors.blueGrey; // Heavy snow grey
    case "Heavy snow":
      return Colors.blueGrey; // Intense grey for heavy snow
    case "Ice pellets":
      return Colors.cyan; // Bright ice
    case "Light rain shower":
      return Colors.lightBlue; // Gentle rain
    case "Moderate or heavy rain shower":
      return Colors.blue; // Strong blue for heavy rain
    case "Torrential rain shower":
      return Colors.indigo; // Intense and stormy
    case "Light sleet showers":
      return Colors.cyan; // Gentle icy mix
    case "Moderate or heavy sleet showers":
      return Colors.cyan; // Intense icy showers
    case "Light snow showers":
      return Colors.grey; // Light snow
    case "Moderate or heavy snow showers":
      return Colors.grey; // Heavy snow
    case "Light showers of ice pellets":
      return Colors.cyan; // Gentle ice showers
    case "Moderate or heavy showers of ice pellets":
      return Colors.cyan; // Heavy ice showers
    case "Patchy light rain with thunder":
      return Colors.deepPurple; // Thunder with rain
    case "Moderate or heavy rain with thunder":
      return Colors.deepPurple; // Stormy thunder
    case "Patchy light snow with thunder":
      return Colors.indigo; // Snowstorm feel
    case "Moderate or heavy snow with thunder":
      return Colors.indigo; // Intense snowstorm
    default:
      return Colors.grey; // Default neutral color
  }
}
