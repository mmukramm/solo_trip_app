import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:solo_trip_app/data/models/country.dart';

class FavoriteCountryProvider with ChangeNotifier {
  final List<Country> _favouriteCountries = [];

  UnmodifiableListView<Country> get favouriteCountries => UnmodifiableListView(_favouriteCountries);

  void addToFavorite(Country country) {
    _favouriteCountries.add(country);
    notifyListeners();
  }

  void removeFromFavorite(Country country) {
    _favouriteCountries.remove(country);
    notifyListeners();
  }
}