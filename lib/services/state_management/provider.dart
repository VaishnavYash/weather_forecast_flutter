import 'package:mobx/mobx.dart';
import 'package:weather_forecast/data/weather.dart';
import 'package:weather_forecast/services/location_services/api_call.dart';

part 'provider.g.dart';

class Provider = _Provider with _$Provider;

abstract class _Provider with Store {
  @observable
  double latitude = 0;
  @observable
  double longitude = 0;
  @observable
  String cityName = '';
  @observable
  WeatherData? weatherData;
  @observable
  bool isLoading = false;
  @observable
  late bool isException;

  @action
  void updateLocation({required lat, required long}) {
    latitude = lat;
    longitude = long;
  }

  @action
  Future<void> updateDataFromLatLong() async {
    isLoading = true;
    try {
      weatherData = await getDatafromLatLong(latitude, longitude);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> updateDataFromName() async {
    isLoading = true;
    try {
      weatherData = await getDatafromName(cityName);
    } finally {
      isLoading = false;
    }
  }
}
