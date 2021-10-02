import 'package:get_it/get_it.dart';
import 'package:proyecto_flutter/data/local/rym_local_data_source.dart';
import 'package:proyecto_flutter/data/local/rym_local_source.dart';
import 'package:proyecto_flutter/data/remote/rym_remote_data_source.dart';
import 'package:proyecto_flutter/data/remote/rym_remote_source.dart';
import 'package:proyecto_flutter/data/repository/rym_repository_impl.dart';
import 'package:proyecto_flutter/data/rym_dao.dart';
import 'package:proyecto_flutter/domain/rym_repository.dart';
import 'package:proyecto_flutter/presentation/home/home_provider.dart';
import 'package:proyecto_flutter/utils/connectivity_checker.dart';
import 'package:proyecto_flutter/utils/connectivity_helper.dart';

final _injector = GetIt.instance;

void setup(){

  _injector.registerLazySingleton<RYMDao>(
          () => RYMDao.db
  );

  _injector.registerLazySingleton<ConnectivityChecker>(
          () => ConnectivityHelper()
  );

  _injector.registerLazySingleton<RYMLocalSource>(
          () => RYMLocalDataSource(
            _injector<RYMDao>(),
          )
  );

  _injector.registerLazySingleton<RYMRemoteSource>(
          () => RYMRemoteDataSource()
  );

  _injector.registerLazySingleton<RYMRepository>(
          () => RYMRepositoryImpl(
              _injector<RYMRemoteSource>(),
              _injector<RYMLocalSource>(),
              _injector<ConnectivityChecker>(),
          )
  );



  _injector.registerLazySingleton(
          () => HomeProvider(_injector<RYMRepository>())
  );


}