
import 'package:dartz/dartz.dart';
import 'package:proyecto_flutter/domain/domain/character_model.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';

abstract class RYMLocalSource{
  Future<Either<String, List<CharacterModel>>> getCharacterList();
  Future<Either<String, Episode>> getEpisodeList();
  Future<Either<String, String>> getCharacterDetail();
}