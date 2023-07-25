import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_weather_app/widgets/day_info.dart';
import '../models/current_model.dart';
import '../models/forecast_model.dart';
import '../providers/current_provider.dart';
import '../providers/forecast_provider.dart';
import '../widgets/main_info.dart';

class WeeklyPage extends StatelessWidget {
  WeeklyPage({super.key});

  List<ForecastModel>? forecast;
  CurrentModel? current;
  Color color = Color(0xfff2f8fa);

  @override
  Widget build(BuildContext context) {
    forecast = Provider.of<ForecastProvider>(context).Forecast;
    current = Provider.of<CurrentProvider>(context).Current;
    return SingleChildScrollView(
      child: Column(
        children: [
          MainInfo(
            height: 401,
            color: current!.getTheme(),
            city: current!.city,
            date: current!.date,
            condition: current!.condition,
            icon: current!.getIcon(),
            temp: current!.temp,
          ),
          DayInfo(
            icon: forecast![0].getIcon(),
            day: forecast![0].date,
            mintemp: forecast![0].minTemp,
            maxtemp: forecast![0].maxTemp,
            condition: forecast![0].condition,
          ),
          const Divider(
            color: Color.fromARGB(255, 212, 211, 211),
            height: 0,
            indent: 20,
            endIndent: 20,
          ),
          DayInfo(
            icon: forecast![1].getIcon(),
            day: forecast![1].date,
            mintemp: forecast![1].minTemp,
            maxtemp: forecast![1].maxTemp,
            condition: forecast![1].condition,
          ),
          const Divider(
            color: Color.fromARGB(255, 212, 211, 211),
            height: 0,
            indent: 20,
            endIndent: 20,
          ),
          DayInfo(
            icon: forecast![2].getIcon(),
            day: forecast![2].date,
            mintemp: forecast![2].minTemp,
            maxtemp: forecast![2].maxTemp,
            condition: forecast![2].condition,
          ),
        ],
      ),
    );
  }
}
