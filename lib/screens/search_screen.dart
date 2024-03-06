import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        title: const Text(
          'Search a City',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            // to customize the cursor color
            cursorColor: Colors.blue,
            /*
            * to access the value inside text field
            *   there are two ways :
            *   - using onChange -> and here we can use log from developer library to see it
            *                       used when you want to track the changes of text typing
            *   - using onSubmitted -> used to send the final value typed
            * */
            // onChanged: (value) {
            //   log(value);
            // },
            onSubmitted: (value) async {
              WeatherModel weatherModel = await WeatherService(Dio())
                  .getCurrentWeather(cityName: value);

              Navigator.of(context).pop();
            },
            decoration: InputDecoration(
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(16),
              //   borderSide: BorderSide(
              //     color: Colors.white
              //   )
              // ),
              /*
              * [enabledBorder] is used to customize the border in its inactive state
              * */
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 3,
                ),
              ),
              /*
              * [enabledBorder] is used to customize the border in its active state
              * */
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 3,
                ),
              ),
              // to add hint text inside input field
              hintText: 'Enter city name:',
              // hintStyle: TextStyle(
              //   color: Colors.blue,
              // ),
              /*
              * to add icons there is two ways :
              * prefixIcon -> icon appear in the left of input field
              * suffixIcon -> icon appear in the right of input field
              * */
              suffixIcon: Icon(
                Icons.search,
              ),
              suffixIconColor: Colors.blue,
              labelText: 'Search',
              labelStyle: TextStyle(color: Colors.blue),
              /*
              * to customize the width and height of text input field
              *  we need to use content padding
              * */
              contentPadding: EdgeInsets.symmetric(
                vertical: 28,
                horizontal: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
