import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/presentation/characters/character_list_page.dart';
import 'package:proyecto_flutter/presentation/episodes/episode_list_page.dart';
import 'package:proyecto_flutter/presentation/home/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  late HomeProvider _homeProvider;

  @override
  Widget build(BuildContext context) {
    _homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick And Morty"),
      ),
      body: _callPage(),
      bottomNavigationBar: _createBottomNavigationBar(),
    );
  }

  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _homeProvider.getCurrentPage(),
      onTap: (index) {
        _homeProvider.setCurrentPage(index);
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon( Icons.mouse_rounded ),
            title: Text('Character')
        ),
        BottomNavigationBarItem(
            icon: Icon( Icons.list ),
            title: Text('Episode')
        ),
      ],
    );
  }

  Widget _callPage() {
    switch(_homeProvider.getCurrentPage()){
      case 0:
        return CharacterListPage();
      case 1:
        return EpisodeListPage();
      default:
        return CharacterListPage();
    }
  }
}
