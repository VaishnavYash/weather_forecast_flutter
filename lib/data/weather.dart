import 'package:weather_forecast/data/current.dart';
import 'package:weather_forecast/data/current_time.dart';
import 'package:weather_forecast/data/location.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class WeatherData {
  WeatherData({this.location, this.current, this.currentTime});

  Location? location;
  Current? current;
  CurrentTime? currentTime;

  factory WeatherData.fromJson(Map<String, dynamic> data) {
    tz.initializeTimeZones();
    final location = tz.getLocation(data['location']['tz_id'].toString());
    final timeOfPlace = tz.TZDateTime.now(location);
    data['currentTime'] = timeOfPlace;

    return WeatherData(
      location: Location.fromJson(data['location']),
      current: Current.fromJson(data['current']),
      currentTime: CurrentTime.fromJson(
        data['currentTime'],
      ),
    );
  }
}
