import 'package:flutter/material.dart';
import 'package:solo_trip_app/data/database/sqlite_service.dart';
import 'package:solo_trip_app/data/models/country.dart';

class FavoriteCountryProvider with ChangeNotifier {
  Future<List<Country>> favouriteCountries = Future<List<Country>>(
    () => SqliteService.getItems(),
  );

  void addToFavorite(Country country) async {
    await SqliteService.insertItem(country);
    favouriteCountries = Future<List<Country>>(
      () => SqliteService.getItems(),
    );
    notifyListeners();
  }

  void removeFromFavorite(int id) async {
    await SqliteService.deleteItem(id);
    favouriteCountries = Future<List<Country>>(
      () => SqliteService.getItems(),
    );
    notifyListeners();
  }

  void clearAll() {
    SqliteService.deleteAllCountry();
    favouriteCountries = Future<List<Country>>(
      () => SqliteService.getItems(),
    );
    notifyListeners();
  }
}
