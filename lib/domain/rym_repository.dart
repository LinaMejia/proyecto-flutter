import 'package:dartz/dartz.dart';
import 'package:proyecto_flutter/domain/domain/character_model.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';

abstract class RYMRepository{
  Future<Either<String, List<CharacterModel>>> getCharacterList();
  Future<Either<String, List<Result>>> getEpisodeList();
  Future<Either<String, String>> getCharacterDetail();
}