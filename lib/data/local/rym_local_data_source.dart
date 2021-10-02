
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
  Future<Either<String, List<CharacterModel>>> getCharacterList() async {
    try{
      var list = await dao.getChracterList();
      return Right(list);
    }catch(e){
      return Left("");
    }
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
  Future<Either<String, List<Result>>> insertEpisodeList(List<Result> episodeList) async {
    await dao.insertEpisodesList(episodeList);
    return Right(episodeList);
  }

  @override
  Future<Either<String, List<CharacterModel>>> insertCharacterList(List<CharacterModel> characterList) async {
    await dao.insertCharacterList(characterList);
    return Right(characterList);
  }

}