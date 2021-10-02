
import 'package:dartz/dartz.dart';
import 'package:proyecto_flutter/data/local/rym_local_source.dart';
import 'package:proyecto_flutter/data/rym_dao.dart';
import 'package:proyecto_flutter/domain/domain/character_model.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';

class RYMLocalDataSource extends RYMLocalSource{
  RYMDao dao;

  RYMLocalDataSource(
      this.dao
      );

  @override
  Future<Either<String, String>> getCharacterDetail() {
    // TODO: implement getCharacterDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<CharacterModel>>> getCharacterList() {
    // TODO: implement getCharacterList
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<Result>>> getEpisodeList() async {
    try{
      var list = await dao.getEpisodesList();
      return Right(list);
    }catch(e){
      return Left("");
    }
  }

  @override
  void insertEpisodeList(List<Result> episodeList) {
    dao.insertEpisodesList(episodeList);
  }

}