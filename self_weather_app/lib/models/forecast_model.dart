import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:self_weather_app/app_icons.dart';

class ForecastModel {
  String? date;
  String? condition;
  double? minTemp;
  double? maxTemp;
  double? feelsLike;

  ForecastModel({
    required this.date,
    required this.condition,
    required this.minTemp,
    required this.maxTemp,
  });

  factory ForecastModel.fromjson(data) {
    Map<String, dynamic> dayData = data['day'];

    return ForecastModel(
        date: data['date'],
        condition: dayData['condition']['text'],
        minTemp: dayData['mintemp_c'],
        maxTemp: dayData['maxtemp_c']);
  }
  // @override
  // String toString() {
  //   return '=> temp : $temp \n date:$date \n Temp: $temp';
  // }

  IconData getIcon() {
    if (condition == 'Sunny' || condition == 'Clear') {
      return AppIcons.sun;
    } else if (condition == 'partly cloudy') {
      return AppIcons.cloud_sun;
    } else if (condition == 'Blizzard' ||
        condition == 'Patchy snow possible' ||
        condition == 'Patchy sleet possible' ||
        condition == 'Patchy freezing drizzle possible' ||
        condition == 'Blowing snow') {
      return AppIcons.hail;
    } else if (condition == 'Freezing fog' || condition == 'Fog') {
      return AppIcons.fog;
    } else if (condition == 'Heavy Cloud') {
      return AppIcons.clouds;
    } else if (condition == 'Mist') {
      return AppIcons.mist;
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return AppIcons.rain;
    } else if (condition == 'Thundery outbreaks possible' ||
        condition == 'Moderate or heavy snow with thunder' ||
        condition == 'Patchy light snow with thunder' ||
        condition == 'Moderate or heavy rain with thunder' ||
        condition == 'Patchy light rain with thunder') {
      return AppIcons.cloud_flash;
    } else {
      return AppIcons.sun;
    }
  }

  MaterialColor getTheme() {
    if (condition == 'Sunny' ||
        condition == 'Clear' ||
        condition == 'partly cloudy') {
      return Colors.orange;
    } else if (condition == 'Blizzard' ||
        condition == 'Patchy snow possible' ||
        condition == 'Patchy sleet possible' ||
        condition == 'Patchy freezing drizzle possible' ||
        condition == 'Blowing snow') {
      return Colors.lightBlue;
    } else if (condition == 'Freezing fog' ||
        condition == 'Fog' ||
        condition == 'Heavy Cloud' ||
        condition == 'Mist') {
      return Colors.grey;
    } else if (condition == 'Patchy rain possible' ||
        condition == 'Heavy Rain' ||
        condition == 'Showers	') {
      return Colors.blueGrey;
    } else if (condition == 'Thundery outbreaks possible' ||
        condition == 'Moderate or heavy snow with thunder' ||
        condition == 'Patchy light snow with thunder' ||
        condition == 'Moderate or heavy rain with thunder' ||
        condition == 'Patchy light rain with thunder') {
      return Colors.yellow;
    } else {
      return Colors.blue;
    }
  }
}
