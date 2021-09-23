import 'package:dartz/dartz.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';
import 'package:proyecto_flutter/domain/rym_repository.dart';

class RYMRepositoryImpl extends RYMRepository{
  @override
  Future<Either<String, String>> getCharacterDetail() async {
    // TODO: implement getCharacterDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> getCharacterList() async {
    // TODO: implement getCharacterList
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Episode>> getEpisodeList() async {
    // TODO: implement getEpisodeList
    throw UnimplementedError();
  }

}