import 'package:mobx/mobx.dart';
import 'package:weather_forecast/data/weather.dart';
import 'package:weather_forecast/services/location_services/api_call.dart';

part 'favourite.g.dart';

class Favourite = _Favourite with _$Favourite;

abstract class _Favourite with Store {
  @observable
  ObservableMap<String, WeatherData> favList =
      ObservableMap<String, WeatherData>();

  @computed
  int get favListLength => favList.length;

  @action
  Future<void> updateFavList(String cityName) async {
    final newWeatherData = await getDatafromName(cityName);
    favList.update(
      cityName,
      (value) => newWeatherData,
      ifAbsent: () => newWeatherData,
    );
  }

  @action
  void refreshFavData() {
    favList.forEach((key, value) async {
      favList[key] = await getDatafromName(key);
    });
  }

  @action
  void removeFavWeatherData(String? cityName) {
    if (cityName == null) {
      return;
    }
    favList.remove(cityName);
  }

  @action
  bool checkFavCity(String cityName) {
    return favList.containsKey(cityName);
  }

  @computed
  bool get isFavEmpty => favList.isEmpty;
}
