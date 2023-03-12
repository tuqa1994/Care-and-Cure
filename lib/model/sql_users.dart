import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQlDb {
  Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initalDb();
      return _db;
    } else {
      return _db;
    }
  }

  initalDb() async {
    String databasePathe = await getDatabasesPath();
    String path = join(databasePathe, 'users.db');
    Database usersDb = await openDatabase(path,
        onCreate: _oncreate, version: 1, onUpgrade: _onupgrade);
    return usersDb;
  }

  _onupgrade(Database db, int oldVersion, int newVersion) async {}

  _oncreate(Database db, int vversion) async {
    await db.execute('''
      CREATE TABLE Users(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT,
        email TEXT,
        password TEXT,
        phoneNumber TEXT,
        image TEXT)
      ''');
  }

  Future<List<Map>> redData(String sql) async {
    try {
      Database? newDb = await db;
      List<Map> response = await newDb!.rawQuery(sql);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  insertData(String sql) async {
    Database? newDb = await db;
    int response = await newDb!.rawInsert(sql);
    return response;
  }
}
