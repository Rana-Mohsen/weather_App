import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:self_weather_app/app_icons.dart';

class DayInfo extends StatelessWidget {
  DayInfo(
      {super.key,
      required this.icon,
      required this.mintemp,
      required this.maxtemp,
      required this.day,
      required this.condition});

  IconData? icon;
  String? day;
  double? mintemp;
  double? maxtemp;
  String? condition;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(
              icon,
              size: 40,
              color: Color(0xff7b7c7c),
            ),
          ),
          Text(
            day!.substring(5, 10),
            style: TextStyle(
              color: Color(0xff7b7c7c),
              height: 1,
              fontSize: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              maxtemp!.toInt().toString() +
                  String.fromCharCode(AppIcons.celcius) +
                  '/' +
                  mintemp!.toInt().toString() +
                  String.fromCharCode(AppIcons.celcius),
              style: TextStyle(
                  color: Color(0xff7b7c7c),
                  height: 1,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "$condition",
            style: TextStyle(
              color: Color(0xff7b7c7c),
              height: 1,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
