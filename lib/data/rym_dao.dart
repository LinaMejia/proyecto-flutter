import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:proyecto_flutter/const.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';
import 'package:sqflite/sqflite.dart';

class RYMDao {
  RYMDao._instance();
  static final RYMDao db = RYMDao._instance();
  late Database _database;

  Future<Database> get database async {
    _database = await _initDB();

    return _database;
  }

  Future<Database> _initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String databasePath = directory.path + DATABASE_NAME;

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(CREATE_RYM_EPISODES_TABLE);
  }

  insertEpisode(Result episode) async {
    final db = await database;
    final res = await db.insert('rym_episodes', episode.toJson());
    return res;
  }

  //Get Episode By Id

  // Future<Result> async{
  //   final db= await database;
  // }

  //   Insert episode List
  // Get Episode List

  Future close() async {
    var dbClient = await database;
    return dbClient.close();
  }
}
