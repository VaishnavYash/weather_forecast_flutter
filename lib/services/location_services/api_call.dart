import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:weather_forecast/data/weather.dart';
import 'package:weather_forecast/services/state_management/provider.dart';

String baseUrl = 'http://api.weatherapi.com/v1/current.json';
String apiKey = '9f9d7c22f18e460eb4e91705242410';

final Provider weatherStore = Provider ();

Future<WeatherData> getDatafromLatLong(double lat, double long) async {
  final uri = Uri.parse('$baseUrl?key=$apiKey&q=$lat,$long');
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    throw Exception('Failed to Load weather data');
  } else {
    final result = jsonDecode(response.body);
    tz.initializeTimeZones();
    final location = tz.getLocation(result['location']['tz_id'].toString());
    final timeOfPlace = tz.TZDateTime.now(location);

    result['currentTime'] = timeOfPlace;
    return WeatherData.fromJson(result);
  }
}

Future<WeatherData> getDatafromName(String cityName) async {
  final uri = Uri.parse('$baseUrl?key=$apiKey&q=$cityName');
  final response = await http.get(uri);

  if (response.statusCode != 200) {
// weatherStore.isException = true;
    throw Exception('Failed to Load weather data');
  } else {
    final result = jsonDecode(response.body);
    return WeatherData.fromJson(result);
  }
}
