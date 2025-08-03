import 'dart:convert';

import 'package:path/path.dart';
import 'package:ramen_recommendation/errors/app_error_code.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:sqflite/sqflite.dart';

import '../../api/responses/place_photo_response.dart';
import '../result.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  Database? _database;

  DatabaseService._internal();

  factory DatabaseService() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favorites.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE favorites (
            id TEXT PRIMARY KEY,
            display_name TEXT,
            address TEXT,
            latitude REAL,
            longitude REAL,
            image TEXT
          )
        ''');
      },
    );
  }

  Future<Result<bool, AppErrorCode>> addFavorite(RamenPlace place) async {
    try {
      final db = await database;
      await db.insert(
        'favorites',
        {
          'id': place.id,
          'display_name': place.displayName.text,
          'address': place.address,
          'latitude': place.location.latitude,
          'longitude': place.location.longitude,
          'image': place.image != null
              ? jsonEncode(place.image?.toJson()) // ← ここがポイント
              : null,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return const Success(true);
    } catch (e) {
      return Failure(AppErrorCode.databaseUnknownError());
    }
  }

  Future<Result<bool, AppErrorCode>> removeFavorite(String id) async {
    try {
      final db = await database;
      final count =
          await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
      return Success(count > 0);
    } catch (e) {
      return Failure(AppErrorCode.databaseUnknownError());
    }
  }

  /// お気に入りを取得し、`RamenPlace` のリストを返却
  Future<Result<List<RamenPlace>, AppErrorCode>> getFavorites() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('favorites');

      return Success(List.generate(maps.length, (i) {
        return RamenPlace(
          id: maps[i]['id'] as String,
          displayName: DisplayName(text: maps[i]['display_name']),
          address: maps[i]['address'],
          location: Location(
            latitude: maps[i]['latitude'] as double,
            longitude: maps[i]['longitude'] as double,
          ),
          image: maps[i]['image'] != null
              ? PlacePhotoResponse.fromJson(jsonDecode(maps[i]['image']))
              : null,
        );
      }));
    } catch (e) {
      return Failure(AppErrorCode.databaseUnknownError());
    }
  }
}
