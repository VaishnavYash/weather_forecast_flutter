// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Management on _Management, Store {
  Computed<int>? _$totallengthComputed;

  @override
  int get totallength =>
      (_$totallengthComputed ??= Computed<int>(() => super.totallength,
              name: '_Management.totallength'))
          .value;

  late final _$addCityNameAtom =
      Atom(name: '_Management.addCityName', context: context);

  @override
  String get addCityName {
    _$addCityNameAtom.reportRead();
    return super.addCityName;
  }

  @override
  set addCityName(String value) {
    _$addCityNameAtom.reportWrite(value, super.addCityName, () {
      super.addCityName = value;
    });
  }

  late final _$cityListAtom =
      Atom(name: '_Management.cityList', context: context);

  @override
  ObservableMap<String, WeatherData> get cityList {
    _$cityListAtom.reportRead();
    return super.cityList;
  }

  @override
  set cityList(ObservableMap<String, WeatherData> value) {
    _$cityListAtom.reportWrite(value, super.cityList, () {
      super.cityList = value;
    });
  }

  late final _$updateListAsyncAction =
      AsyncAction('_Management.updateList', context: context);

  @override
  Future<void> updateList(String cityName) {
    return _$updateListAsyncAction.run(() => super.updateList(cityName));
  }

  late final _$_ManagementActionController =
      ActionController(name: '_Management', context: context);

  @override
  void removeWeatherData(String? cityName) {
    final _$actionInfo = _$_ManagementActionController.startAction(
        name: '_Management.removeWeatherData');
    try {
      return super.removeWeatherData(cityName);
    } finally {
      _$_ManagementActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool checkCity(String cityName) {
    final _$actionInfo = _$_ManagementActionController.startAction(
        name: '_Management.checkCity');
    try {
      return super.checkCity(cityName);
    } finally {
      _$_ManagementActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refreshData() {
    final _$actionInfo = _$_ManagementActionController.startAction(
        name: '_Management.refreshData');
    try {
      return super.refreshData();
    } finally {
      _$_ManagementActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
addCityName: ${addCityName},
cityList: ${cityList},
totallength: ${totallength}
    ''';
  }
}
