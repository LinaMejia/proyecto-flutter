
import 'package:dartz/dartz.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';

abstract class RYMRemoteSource{
  Future<Either<String, String>> getCharacterList();
  Future<Either<String, Episode>> getEpisodeList();
  Future<Either<String, String>> getCharacterDetail();
}