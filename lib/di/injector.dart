import 'package:get_it/get_it.dart';
import 'package:proyecto_flutter/presentation/home/home_provider.dart';

final _injector = GetIt.instance;

void setup(){

  _injector.registerLazySingleton(
          () => HomeProvider()
  );


}