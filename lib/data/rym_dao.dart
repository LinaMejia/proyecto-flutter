import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:proyecto_flutter/const.dart';
import 'package:proyecto_flutter/domain/domain/character_model.dart';
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
    await db.execute(CREATE_RYM_CHAR_TABLE);
  }

  //Insert single episode
  insertEpisode(Result episode) async {
    final db = await database;
    try {
      final updateId = await db.update('rym_episodes', episode.toJson(), where: 'id = ?', whereArgs: [episode.id]);
      if (updateId == 0) {
        final res = await db.insert('rym_episodes', episode.toJson());
        return res;
      }
      return updateId;
    }catch(e){
      return 0;
    }

  }

  //Insert single character
  insertCharacter(CharacterModel character) async {
    final db = await database;
    final res = await db.insert('rym_characters', character.toJson());
    return res;
  }

  //Insert List of episodes
  Future insertEpisodesList(List<Result> episodes) async {
    (episodes as List).forEach((ep) async {
      var res = await insertEpisode(ep);
      print(res);
    });
  }

  //Insert List of characters
  Future insertCharacterList(List<CharacterModel> characters) async {
    (characters as List).forEach((char) async {
      var res = await insertCharacter(char);
    });
  }

  // get episode by Id
  Future<Result?> getEpisodeById(int id) async {
    final db = await database;
    final res =
        await db.query('rym_episodes', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Result.fromJson(res.first) : null;
  }

// get character by Id
  Future<Result?> getCharacterById(int id) async {
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

  // Get Character List
  Future<List<CharacterModel>> getChracterList() async {
    final db = await database;
    final res = await db.query('rym_characters');
    List<CharacterModel> list =
    res.isNotEmpty ? res.map((s) => CharacterModel.fromJson(s)).toList() : [];
    return list;
  }

  Future close() async {
    var dbClient = await database;
    return dbClient.close();
  }
}
