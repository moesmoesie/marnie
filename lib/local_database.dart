import 'package:flutter/material.dart';
import 'package:marnie/models/dream.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  final Database _database;
  LocalDatabase(this._database);

  static Future<LocalDatabase> loadDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    String sql =
        "CREATE TABLE dreams(id TEXT PRIMARY KEY, title TEXT, text INTEGER, tags BLOB)";

    final database = await openDatabase(
      join(await getDatabasesPath(), 'dreams_database.db'),
      onCreate: (db, version) {
        return db.execute(sql);
      },
      version: 1,
    );

    final localDatabase = LocalDatabase(database);
    // localDatabase.insertDream(Dream(Uuid().v1(), tags: ["hello world"],),);
    return localDatabase;
  }

  Future<void> insertDream(Dream dream) async {
    final db = this._database;
    await db.insert(
      'dreams',
      dream.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteDream(Dream dream) async {
    final db = this._database;
    await db.delete(
      "dreams",
      where: "id = ?",
      whereArgs: [dream.id!],
    );
  }

  Future<List<Dream>> loadDreams() async {
    final List<Map<String, dynamic>> maps = await _database.query('dreams');
    return List.generate(maps.length, (i) {
      return Dream.fromMap(maps[i]);
    });
  }
}
