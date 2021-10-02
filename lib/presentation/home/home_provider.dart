import 'package:flutter/material.dart';
import 'package:proyecto_flutter/domain/domain/character_model.dart';
import 'package:proyecto_flutter/domain/domain/episode_model.dart';
import 'package:proyecto_flutter/domain/rym_repository.dart';

class HomeProvider extends ChangeNotifier {
  final RYMRepository _rymRepository;
  HomeProvider(this._rymRepository);

  int _currentPage = 0;
  List<Result>? _episodes;
  List<Result>? get episodes => _episodes;

  List<CharacterModel>? _characters;
  List<CharacterModel>? get characters => _characters;

  void setCurrentPage(int index) {
    this._currentPage = index;
    notifyListeners();
  }

  int getCurrentPage() {
    return _currentPage;
  }

  void loadData(){
    getCharacters();
    getEpisodes();
  }

  void getEpisodes() async {
    final data = await _rymRepository.getEpisodeList();
    data.fold((l) => {}, (r) => _episodes = r);
    notifyListeners();
  }

  void getCharacters() async {
    final data = await _rymRepository.getCharacterList();
    data.fold((l) => {}, (r) => _characters = r);
    notifyListeners();
  }
}
