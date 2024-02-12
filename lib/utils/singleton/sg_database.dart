import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDB();
    return _database;
  }

  Future<Database?> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}/kinodatabase';
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute("""CREATE TABLE Kino(id INTEGER,name TEXT, shortDescription TEXT, ratingImb TEXT);""");
  }

  Future<void> addKino(Map<String, dynamic> kino) async {
    Database? db = await this.database;
    if (db != null) await db.insert('Kino', kino);
  }

  Future<List<Map<String, dynamic>>> getAllKinos() async {
    Database? db = await this.database;

    final List<Map<String, dynamic>> data = await db?.query('Kino') ?? [];
    return data;
  }

  Future<int> deleteKino(int id) async {
    Database? db = await this.database;
    return await db?.delete('Kino', where: 'id = ?', whereArgs: [id]) ?? -1;
  }
}
