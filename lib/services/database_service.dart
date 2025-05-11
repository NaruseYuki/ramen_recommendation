import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
            name TEXT,
            address TEXT,
            latitude REAL,
            longitude REAL
          )
        ''');
      },
    );
  }

  Future<void> addFavorite(RamenPlace place) async {
    final db = await database;
    await db.insert('favorites', place as Map<String, Object?>,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removeFavorite(String id) async {
    final db = await database;
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  /// お気に入りを取得し、`RamenPlace` のリストを返却
  Future<List<RamenPlace>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favorites');

    // Map を RamenPlace に変換してリストとして返却
    return List.generate(maps.length, (i) {
      return RamenPlace(
        id: maps[i]['id'] as String,
        name: maps[i]['name'] as String,
        address: maps[i]['address'] as String,
        latitude: maps[i]['latitude'] as double,
        longitude: maps[i]['longitude'] as double,
      );
    });
  }
}
