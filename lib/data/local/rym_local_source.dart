
import 'package:dartz/dartz.dart';
import 'package:proyecto_flutter/domain/domain/character_model.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';

abstract class RYMLocalSource{
  Future<Either<String, List<CharacterModel>>> getCharacterList();
  Future<Either<String, List<Result>>> getEpisodeList();
  Future<Either<String, String>> getCharacterDetail();
  Future<Either<String, List<Result>>> insertEpisodeList(List<Result> episodeList);
  Future<Either<String, List<CharacterModel>>> insertCharacterList(List<CharacterModel> characterList);
}