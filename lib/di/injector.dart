import 'package:get_it/get_it.dart';
import 'package:proyecto_flutter/data/remote/rym_remote_data_source.dart';
import 'package:proyecto_flutter/data/remote/rym_remote_source.dart';
import 'package:proyecto_flutter/data/repository/rym_repository_impl.dart';
import 'package:proyecto_flutter/domain/rym_repository.dart';
import 'package:proyecto_flutter/presentation/home/home_provider.dart';

final _injector = GetIt.instance;

void setup(){

  _injector.registerLazySingleton<RYMRemoteSource>(
          () => RYMRemoteDataSource()
  );

  _injector.registerLazySingleton<RYMRepository>(
          () => RYMRepositoryImpl( _injector<RYMRemoteSource>())
  );



  _injector.registerLazySingleton(
          () => HomeProvider(_injector<RYMRepository>())
  );


}