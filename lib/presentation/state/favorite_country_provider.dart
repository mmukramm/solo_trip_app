import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:solo_trip_app/data/data_source/all_country_data.dart';
import 'package:solo_trip_app/data/models/country.dart';

class FavoriteCountryProvider extends ChangeNotifier {
  final List<Country> _favouriteCountries = [countryList[0]];

  UnmodifiableListView<Country> get favouriteCountries => UnmodifiableListView(_favouriteCountries);
}