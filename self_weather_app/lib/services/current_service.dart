import 'dart:convert';

import '../models/current_model.dart';
import 'package:http/http.dart' as http;

class CurrentService {
  Future<CurrentModel> getCurrentServive({required String city}) async {
    Uri url = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=388255f68e4147d580c140557230703&q=$city&aqi=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);

    return CurrentModel.fromjson(data);
  }
}
