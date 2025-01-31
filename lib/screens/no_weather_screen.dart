import 'package:flutter/material.dart';

class NoWeatherScreen extends StatelessWidget {
  const NoWeatherScreen({
    super.key,
    this.text1,
    this.text2,
  });

  final String? text1;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1 ?? 'There is no weather 😔',
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            text2 ?? 'Start searching Now 🔍',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
