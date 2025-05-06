// lib/services/database_service.dart
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

import '../errors/app_error_code.dart';

class DatabaseService {
  static Database? _database;

  /// データベースを初期化し、接続を確立する
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initializeDb();
    return _database!;
  }

  /// データベースを初期化する
  Future<Database> _initializeDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'ramen.db'); // データベースファイル名
    final db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  /// データベース作成時の処理
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS ramen_shops (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        type TEXT,
        latitude REAL,
        longitude REAL,
        rating REAL,
        imageUrl TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS favorite_shops (
        place_id TEXT PRIMARY KEY,
        name TEXT,
        vicinity TEXT,
        latitude REAL,
        longitude REAL
      )
    ''');
  }

  /// ラーメン店情報を取得する (未使用になったため、必要に応じて修正または削除)
  Future<List<Map<String, dynamic>>> getRamenShopsByType(String type) async {
    final db = await database;
    try {
      final results = await db.query(
        'ramen_shops',
        where: 'type = ?',
        whereArgs: [type],
      );
      return results;
    } catch (e) {
      throw AppErrorCode.databaseUnknownError();
    }
  }

  /// お気に入りに追加
  Future<void> addFavoriteShop(Map<String, dynamic> place) async {
    final db = await database;
    try {
      await db.insert(
        'favorite_shops',
        {
          'place_id': place['place_id'],
          'name': place['name'],
          'vicinity': place['vicinity'],
          'latitude': place['geometry']['location']['lat'],
          'longitude': place['geometry']['location']['lng'],
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw AppErrorCode.databaseUnknownError();
    }
  }

  /// お気に入りから削除
  Future<void> removeFavoriteShop(String placeId) async {
    final db = await database;
    try {
      await db.delete(
        'favorite_shops',
        where: 'place_id = ?',
        whereArgs: [placeId],
      );
    } catch (e) {
      throw AppErrorCode.databaseUnknownError();
    }
  }

  /// お気に入りを取得
  Future<List<Map<String, dynamic>>> getFavoriteShops() async {
    final db = await database;
    try {
      final results = await db.query('favorite_shops');
      return results;
    } catch (e) {
      throw AppErrorCode.databaseUnknownError();
    }
  }

  /// データベースを閉じる
  Future<void> closeDb() async {
    final db = await database;
    db.close();
  }
}
