import 'package:dartz/dartz.dart';
import 'package:proyecto_flutter/data/remote/rym_remote_source.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';
import 'package:proyecto_flutter/domain/rym_repository.dart';

class RYMRepositoryImpl extends RYMRepository{

  final RYMRemoteSource _rymRemoteSource;
  RYMRepositoryImpl(this._rymRemoteSource);

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
    return _rymRemoteSource.getEpisodeList();
  }

}