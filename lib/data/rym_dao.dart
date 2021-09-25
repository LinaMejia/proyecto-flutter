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

    var db = await openDatabase(databasePath,
        version: 1, onOpen: (db) {}, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(CREATE_RYM_EPISODES_TABLE);
  }

  //Insert single episode
  insertEpisode(Result episode) async {
    final db = await database;
    final res = await db.insert('rym_episodes', episode.toJson());
    return res;
  }

  //Insert List of episodes
  insertEpisodesList(List<Result> episodes) {
    (episodes as List).forEach((ep) async {
      var res = await insertEpisode(ep);
      print(res);
    });
  }

  // get episode by Id
  Future<Result?> getEpisodeById(int id) async {
    final db = await database;
    final res =
        await db.query('rym_episodes', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Result.fromJson(res.first) : null;
  }

  // Get Episodes List
  Future<List<Result>> getEpisodesList() async {
    final db = await database;
    final res = await db.query('rym_episodes');
    List<Result> list =
        res.isNotEmpty ? res.map((s) => Result.fromJson(s)).toList() : [];
    return list;
  }

  Future close() async {
    var dbClient = await database;
    return dbClient.close();
  }
}
