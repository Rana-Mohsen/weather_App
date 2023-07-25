import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:self_weather_app/models/current_model.dart';

import '../app_icons.dart';

class MainInfo extends StatelessWidget {
  MainInfo(
      {super.key,
      required this.height,
      required this.color,
      required this.city,
      required this.condition,
      required this.date,
      required this.icon,
      required this.temp});

  double height;
  MaterialColor? color;
  String? city;
  String? date;
  String? condition;
  IconData? icon;
  double? temp;
  Color fontColor = Color(0xfff2f8fa);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              color![200]!,
              color![300]!,
              color!,
            ]),
      ),
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(left: 19, right: 45, top: 120),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(TextSpan(
                      style: TextStyle(color: fontColor, height: 1),
                      children: [
                        TextSpan(
                            text: "$city\n",
                            style: TextStyle(
                              fontSize: 30,
                            )),
                        TextSpan(
                            text: "$date\n\n", style: TextStyle(fontSize: 15)),
                        TextSpan(
                            text: "$condition",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))
                      ])),
                  Icon(
                    icon,
                    size: 90,
                    color: fontColor,
                  )
                ],
              ),
              Wrap(
                children: [
                  Text(temp!.toInt().toString(),
                      style: TextStyle(
                          color: fontColor,
                          fontSize: 70,
                          fontWeight: FontWeight.bold)),
                  Text(String.fromCharCode(AppIcons.celcius),
                      style: TextStyle(
                        color: fontColor,
                        fontSize: 31,
                      ))
                ],
              )
            ]),
      ),
    );
  }
}
