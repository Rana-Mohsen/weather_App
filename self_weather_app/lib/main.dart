import 'package:flutter/material.dart';
import 'package:self_weather_app/pages/search_page.dart';
import 'package:provider/provider.dart';
import 'package:self_weather_app/providers/forecast_provider.dart';

import 'models/current_model.dart';
import 'pages/home_page.dart';
import 'providers/current_provider.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CurrentProvider()),
        ChangeNotifierProvider(create: (context) => ForecastProvider()),
      ],
        child: MaterialApp(
          theme: ThemeData(fontFamily: 'Khula'),
          debugShowCheckedModeBanner: false,
          home: SearchPage(iconTaped: false,),
        ),
    );
  }
}
