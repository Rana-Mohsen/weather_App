import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:self_weather_app/app_icons.dart';

class CurrentSupInfo extends StatelessWidget {
  CurrentSupInfo(
      {super.key,
      required this.icon,
      required this.desc,
      required this.number});

  IconData icon;
  String desc;
  String number;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: 130,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(
              icon,
              size: 40,
              color: Color(0xff7b7c7c),
            ),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
              text: "$desc\n",
              style: TextStyle(
                color: Color(0xff7b7c7c),
                height: 1,
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: number,
              style: TextStyle(
                  height: 1.1, fontWeight: FontWeight.bold, fontSize: 11),
            )
          ])),
        ],
      ),
    );
  }
}
