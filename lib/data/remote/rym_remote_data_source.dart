import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_flutter/data/remote/remote_constants.dart';
import 'package:proyecto_flutter/data/remote/rym_remote_source.dart';
import 'package:proyecto_flutter/domain/domain/character_model.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';

class RYMRemoteDataSource extends RYMRemoteSource {

  @override
  Future<Either<String, String>> getCharacterDetail() {
    // TODO: implement getCharacterDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<CharacterModel>>> getCharacterList() async {
    try {
      final url = Uri.parse(characterUrl);
      final result = await http.get(url);
      if (result.statusCode == 200) {
        final response = jsonDecode(result.body)["results"];
        List<CharacterModel> list = [];
        (response as List).forEach((e) => {
          list.add(CharacterModel.fromJson(e))
        });
        return Right(list);
      } else {
        return Left("");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Episode>> getEpisodeList() async {
    var episodePage;
    try {
      final url = Uri.parse(episodeUrl);
      final result = await http.get(url);
      if (result.statusCode == 200) {
        episodePage = episodeFromJson(result.body);
        return Right(episodePage);
      } else {
        return Left("");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
