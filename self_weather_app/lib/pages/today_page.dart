import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:self_weather_app/app_icons.dart';
import 'package:self_weather_app/models/current_model.dart';
import 'package:provider/provider.dart';
import '../providers/current_provider.dart';
import '../widgets/current_supnfo.dart';
import '../widgets/main_info.dart';

class TodayPage extends StatelessWidget {
  TodayPage({super.key});

  CurrentModel? current;
  @override
  Widget build(BuildContext context) {
    current = Provider.of<CurrentProvider>(context).Current;

    return SingleChildScrollView(
      child: Column(
        children: [
          MainInfo(
            height: 500,
            color: current!.getTheme(),
            city: current!.city,
            date: current!.date,
            condition: current!.condition,
            icon: current!.getIcon(),
            temp: current!.temp,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CurrentSupInfo(
                    icon: AppIcons.temperatire,
                    desc: "Feels Like",
                    number: current!.feelsLike!.toInt().toString() +
                        String.fromCharCode(AppIcons.celcius),
                  ),
                  CurrentSupInfo(
                    icon: Icons.water_drop_outlined,
                    desc: "Humidity",
                    number: current!.humidity.toString() + '%',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CurrentSupInfo(
                    icon: AppIcons.wind,
                    desc: "Wind",
                    number: current!.wind.toString() + "Km/h",
                  ),
                  CurrentSupInfo(
                    icon: AppIcons.sun,
                    desc: "UV index",
                    number: current!.uv!.toInt().toString(),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
