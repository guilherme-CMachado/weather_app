import 'dart:convert';
import 'package:weatherapp_starter_project/models/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/models/weather_data_current.dart';
import 'package:weatherapp_starter_project/models/weather_data_daily.dart';
import 'package:weatherapp_starter_project/models/weather_data_hourly.dart';
import '../utils/api_url.dart';

class FetchWeather {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, long) async {
    var response = await http.get(Uri.parse(apiUrl(lat, long)));
    var json = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(json),
        WeatherDataHourly.fromJson(json), WeatherDataDaily.fromJson(json));
    return weatherData!;
  }
}
