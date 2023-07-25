import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_weather_app/models/current_model.dart';
import 'package:self_weather_app/models/forecast_model.dart';
import 'package:self_weather_app/pages/home_page.dart';
import 'package:self_weather_app/providers/current_provider.dart';
import 'package:self_weather_app/providers/forecast_provider.dart';
import 'package:self_weather_app/services/current_service.dart';
import 'package:self_weather_app/services/forecast_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, this.iconTaped = true});

  bool iconTaped;
  String? city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/sky.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.6),
                          spreadRadius: 5,
                          blurRadius: 7)
                    ]),
                child: TextField(
                  onChanged: (value) => city = value,
                  onSubmitted: (value) async {
                    city = value;

                    CurrentService currentService = CurrentService();
                    ForecastService forecastService = ForecastService();

                    CurrentModel current =
                        await currentService.getCurrentServive(city: city!);
                    List<ForecastModel> forecast =
                        await forecastService.getForecastServive(city: city!);

                    Provider.of<CurrentProvider>(context, listen: false)
                        .Current = current;
                    Provider.of<ForecastProvider>(context, listen: false)
                        .Forecast = forecast;

                    if (iconTaped) {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    labelText: "City",
                    labelStyle: TextStyle(fontSize: 20),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    suffixIcon: Icon(Icons.search, size: 30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                  onPressed: () async {
                    CurrentService currentService = CurrentService();
                    ForecastService forecastService = ForecastService();
                    CurrentModel current =
                        await currentService.getCurrentServive(city: city!);
                    List<ForecastModel> forecast =
                        await forecastService.getForecastServive(city: city!);

                    Provider.of<CurrentProvider>(context, listen: false)
                        .Current = current;
                    Provider.of<ForecastProvider>(context, listen: false)
                        .Forecast = forecast;

                    if (iconTaped) {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                    //print(current);
                  },
                  child: Text(
                    "Get Weather",
                    style: TextStyle(
                        fontSize: 17, color: Color.fromARGB(255, 74, 103, 118)),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 102, 170, 225)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))))),
            )
          ],
        ),
      ),
    );
  }
}
