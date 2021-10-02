// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/presentation/characters/character_detail.dart';
import 'di/injector.dart';
import 'presentation/home/home_page.dart';
import 'presentation/home/home_provider.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<HomeProvider>()..loadData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'home',
        routes: {
          'home': (BuildContext context) => HomePage(),
          'detail': (BuildContext context) => CharacterDetail(),
        },
      ),
    );
  }
}
