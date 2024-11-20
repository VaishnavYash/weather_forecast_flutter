// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Provider on _Provider, Store {
  late final _$latitudeAtom =
      Atom(name: '_Provider.latitude', context: context);

  @override
  double get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(double value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  late final _$longitudeAtom =
      Atom(name: '_Provider.longitude', context: context);

  @override
  double get longitude {
    _$longitudeAtom.reportRead();
    return super.longitude;
  }

  @override
  set longitude(double value) {
    _$longitudeAtom.reportWrite(value, super.longitude, () {
      super.longitude = value;
    });
  }

  late final _$cityNameAtom =
      Atom(name: '_Provider.cityName', context: context);

  @override
  String get cityName {
    _$cityNameAtom.reportRead();
    return super.cityName;
  }

  @override
  set cityName(String value) {
    _$cityNameAtom.reportWrite(value, super.cityName, () {
      super.cityName = value;
    });
  }

  late final _$weatherDataAtom =
      Atom(name: '_Provider.weatherData', context: context);

  @override
  WeatherData? get weatherData {
    _$weatherDataAtom.reportRead();
    return super.weatherData;
  }

  @override
  set weatherData(WeatherData? value) {
    _$weatherDataAtom.reportWrite(value, super.weatherData, () {
      super.weatherData = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_Provider.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isExceptionAtom =
      Atom(name: '_Provider.isException', context: context);

  @override
  bool get isException {
    _$isExceptionAtom.reportRead();
    return super.isException;
  }

  bool _isExceptionIsInitialized = false;

  @override
  set isException(bool value) {
    _$isExceptionAtom.reportWrite(
        value, _isExceptionIsInitialized ? super.isException : null, () {
      super.isException = value;
      _isExceptionIsInitialized = true;
    });
  }

  late final _$updateDataFromLatLongAsyncAction =
      AsyncAction('_Provider.updateDataFromLatLong', context: context);

  @override
  Future<void> updateDataFromLatLong() {
    return _$updateDataFromLatLongAsyncAction
        .run(() => super.updateDataFromLatLong());
  }

  late final _$updateDataFromNameAsyncAction =
      AsyncAction('_Provider.updateDataFromName', context: context);

  @override
  Future<void> updateDataFromName() {
    return _$updateDataFromNameAsyncAction
        .run(() => super.updateDataFromName());
  }

  late final _$_ProviderActionController =
      ActionController(name: '_Provider', context: context);

  @override
  void updateLocation({required dynamic lat, required dynamic long}) {
    final _$actionInfo = _$_ProviderActionController.startAction(
        name: '_Provider.updateLocation');
    try {
      return super.updateLocation(lat: lat, long: long);
    } finally {
      _$_ProviderActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
latitude: ${latitude},
longitude: ${longitude},
cityName: ${cityName},
weatherData: ${weatherData},
isLoading: ${isLoading},
isException: ${isException}
    ''';
  }
}
