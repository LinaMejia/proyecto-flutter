import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_flutter/data/remote/rym_remote_source.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';

class RYMRemoteDataSource extends RYMRemoteSource {
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
  Future<Either<String, Episode>> getEpisodeList() async {
    var episodePage;
    try {
      final url = Uri.parse('https://rickandmortyapi.com/api/episode');
      final result = await http.get(url);
      if (result.statusCode == 200) {
        episodePage = episodeFromJson(result.body);
        return Right(episodePage);
      } else {
        return Left("");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
