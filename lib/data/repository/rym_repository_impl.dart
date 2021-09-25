import 'package:dartz/dartz.dart';
import 'package:proyecto_flutter/data/local/rym_local_source.dart';
import 'package:proyecto_flutter/data/remote/rym_remote_source.dart';
import 'package:proyecto_flutter/domain/domain/character_model.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';
import 'package:proyecto_flutter/domain/rym_repository.dart';
import 'package:proyecto_flutter/utils/connectivity_checker.dart';

class RYMRepositoryImpl extends RYMRepository{

  final RYMRemoteSource _rymRemoteSource;
  final RYMLocalSource _rymLocalSource;
  final ConnectivityChecker _connectivityChecker;
  RYMRepositoryImpl(
      this._rymRemoteSource,
      this._rymLocalSource,
      this._connectivityChecker
      );

  @override
  Future<Either<String, String>> getCharacterDetail() async {
    // TODO: implement getCharacterDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<CharacterModel>>> getCharacterList() async {
    var isInternetAvailable = await _connectivityChecker.isInternetAvailable();
    if(isInternetAvailable){
      final data = await _rymRemoteSource.getCharacterList();
      data.fold(
              (l) => {},
              (r) => {}
      );
      return _rymRemoteSource.getCharacterList();
    }else{
      return _rymRemoteSource.getCharacterList();
    }

  }

  @override
  Future<Either<String, Episode>> getEpisodeList() async {
    var isInternetAvailable = await _connectivityChecker.isInternetAvailable();
    if(isInternetAvailable){
      final data = await _rymRemoteSource.getEpisodeList();
      data.fold(
              (l) => {},
              (r) => {}
      );
      return _rymRemoteSource.getEpisodeList();
    }else{
      return _rymRemoteSource.getEpisodeList();
    }
  }

}