import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_now/models/daily_data_model.dart';
import 'package:weather_now/services/constant.dart';

const String openWeatherURL =
    "https://api.openweathermap.org/data/2.5/onecall?lat=33.441792&lon=-94.037689&exclude=current,minutely,hourly&appid=$apikey&units=metric";

class DailyDataService {
  Future<List<DailyWeather>> fetchDailyWeather() async {
    http.Response response = await http.get(Uri.parse(openWeatherURL));

    if (response.statusCode == 200) {
      Map dailyData = jsonDecode(response.body);
      List<dynamic> dailyList = dailyData["daily"];
      return dailyList.map((json) => DailyWeather.fromJson(json)).toList();
    } else {
      throw Exception("Something gone wrong, ${response.statusCode}");
    }
  }
}
