
import 'package:dartz/dartz.dart';

abstract class RYMLocalSource{
  Future<Either<String, String>> getCharacterList();
  Future<Either<String, String>> getEpisodeList();
  Future<Either<String, String>> getCharacterDetail();
}