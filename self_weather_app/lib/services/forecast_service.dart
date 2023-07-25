import 'dart:convert';

import 'package:self_weather_app/models/forecast_model.dart';

import '../models/current_model.dart';
import 'package:http/http.dart' as http;

class ForecastService {
  Future<List<ForecastModel>> getForecastServive({required String city}) async {
    Uri url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=388255f68e4147d580c140557230703&q=$city&days=7&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    List<ForecastModel> weekData = [];
    List<dynamic> dataList = data["forecast"]["forecastday"];
    for (int i = 0; i < dataList.length; i++) {
      weekData.add(ForecastModel.fromjson(dataList[i]));
    }
    return weekData;
  }
}
