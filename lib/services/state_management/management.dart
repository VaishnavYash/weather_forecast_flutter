import 'package:mobx/mobx.dart';
import 'package:weather_forecast/data/weather.dart';
import 'package:weather_forecast/services/location_services/api_call.dart';

part 'management.g.dart';

class Management = _Management with _$Management;

abstract class _Management with Store {
  @observable
  String addCityName = '';
  @observable
  ObservableMap<String, WeatherData> cityList =
      ObservableMap<String, WeatherData>();

  @action
  Future<void> updateList(String cityName) async {
    final newweatherData = await getDatafromName(cityName);
    cityList.update(
      cityName,
      (value) => newweatherData,
      ifAbsent: () => newweatherData,
    );
  }

  @computed
  int get totallength => cityList.length;

  @action
  void removeWeatherData(String? cityName) {
    if (cityName == null) return;
    cityList.remove(cityName);
  }

  @action
  bool checkCity(String cityName) {
    return cityList.containsKey(cityName);
  }

  @action
  void refreshData() {
    cityList.forEach((key, value) async {
      cityList[key] = await getDatafromName(key);
    });
  }
}
