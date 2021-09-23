
import 'package:dartz/dartz.dart';
import 'package:proyecto_flutter/data/remote/rym_remote_source.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';

class RYMRemoteDataSource extends RYMRemoteSource{
  @override
  Future<Either<String, String>> getCharacterDetail() {
    // TODO: implement getCharacterDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> getCharacterList() {
    // TODO: implement getCharacterList
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Episode>> getEpisodeList() {
    // TODO: implement getEpisodeList
    throw UnimplementedError();
  }

}