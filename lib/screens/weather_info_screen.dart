import 'package:flutter/material.dart';

class WeatherInfoScreen extends StatelessWidget {
  const WeatherInfoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Cairo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text(
            'updated at 14:00',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                  'assets/images/clear.png',
              ),
              Text(
                '35',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MaxTemp 40',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'MinTemp  33',
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Sunny',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
