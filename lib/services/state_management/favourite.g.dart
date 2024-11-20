// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Favourite on _Favourite, Store {
  Computed<int>? _$favListLengthComputed;

  @override
  int get favListLength =>
      (_$favListLengthComputed ??= Computed<int>(() => super.favListLength,
              name: '_Favourite.favListLength'))
          .value;
  Computed<bool>? _$isFavEmptyComputed;

  @override
  bool get isFavEmpty => (_$isFavEmptyComputed ??=
          Computed<bool>(() => super.isFavEmpty, name: '_Favourite.isFavEmpty'))
      .value;

  late final _$favListAtom = Atom(name: '_Favourite.favList', context: context);

  @override
  ObservableMap<String, WeatherData> get favList {
    _$favListAtom.reportRead();
    return super.favList;
  }

  @override
  set favList(ObservableMap<String, WeatherData> value) {
    _$favListAtom.reportWrite(value, super.favList, () {
      super.favList = value;
    });
  }

  late final _$updateFavListAsyncAction =
      AsyncAction('_Favourite.updateFavList', context: context);

  @override
  Future<void> updateFavList(String cityName) {
    return _$updateFavListAsyncAction.run(() => super.updateFavList(cityName));
  }

  late final _$_FavouriteActionController =
      ActionController(name: '_Favourite', context: context);

  @override
  void refreshFavData() {
    final _$actionInfo = _$_FavouriteActionController.startAction(
        name: '_Favourite.refreshFavData');
    try {
      return super.refreshFavData();
    } finally {
      _$_FavouriteActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFavWeatherData(String? cityName) {
    final _$actionInfo = _$_FavouriteActionController.startAction(
        name: '_Favourite.removeFavWeatherData');
    try {
      return super.removeFavWeatherData(cityName);
    } finally {
      _$_FavouriteActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool checkFavCity(String cityName) {
    final _$actionInfo = _$_FavouriteActionController.startAction(
        name: '_Favourite.checkFavCity');
    try {
      return super.checkFavCity(cityName);
    } finally {
      _$_FavouriteActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favList: ${favList},
favListLength: ${favListLength},
isFavEmpty: ${isFavEmpty}
    ''';
  }
}
