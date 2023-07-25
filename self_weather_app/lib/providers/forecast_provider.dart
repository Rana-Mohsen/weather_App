import 'package:flutter/material.dart';
import '../models/forecast_model.dart';

class ForecastProvider extends ChangeNotifier {
  List<ForecastModel>? _forecast;
  set Forecast(List<ForecastModel>? forecastData) {
    _forecast = forecastData;
    notifyListeners();
  }

  List<ForecastModel>? get Forecast => _forecast;
}
