import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:self_weather_app/pages/search_page.dart';
import 'package:self_weather_app/pages/share_page.dart';
import 'package:self_weather_app/pages/today_page.dart';

import '../models/current_model.dart';
import '../providers/current_provider.dart';
import '../widgets/main_info.dart';
import 'weekly_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final body = [TodayPage(), WeeklyPage(), SharePage()];
  CurrentModel? current;
  @override
  Widget build(BuildContext context) {
    current = Provider.of<CurrentProvider>(context).Current;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 19),
            child: GestureDetector(
              child: Icon(
                Icons.search,
              ),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => SearchPage()));
              },
            ),
          )
        ],
      ),
      body:  body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: const Color(0xffe7e7e8),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.today_outlined), label: "Today"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: "Weekly"),
          BottomNavigationBarItem(icon: Icon(Icons.share), label: "Share"),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
