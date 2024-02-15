import 'package:flutter/material.dart';
import 'package:solo_trip_app/data/models/country.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  static Future<Database> initDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'solotripapp.db'),
      onCreate: (db, version) async {
        debugPrint("Creating database...");
        await db.execute('''CREATE TABLE Countries(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            countryName VARCHAR(255),
            flag VARCHAR(255),
            population INTEGER,
            region VARCHAR(255),
            backdropImage VARCHAR(255),
            capital VARCHAR(255),
            overview VARCHAR(255)
          )''');
      },
      version: 1,
    );
  }

  static Future<int> insertItem(Country country) async {
    final Database db = await initDB();
    return await db.insert(
      "Countries",
      country.toMap(),
    );
  }

  static Future<List<Country>> getItems() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> queryResult = await db.query("Countries");
    return queryResult.map((e) => Country.fromMap(e)).toList();
  }

  static Future<void> deleteItem(int id) async {
    final Database db = await initDB();
    try {
      db.delete("Countries", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("something error: $err");
    }
  }

  static Future<void> deleteAllCountry() async {
    final Database db = await initDB();
    try {
      db.delete("Countries");
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
