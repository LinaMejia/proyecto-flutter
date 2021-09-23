import 'package:flutter/material.dart';
import 'package:proyecto_flutter/domain/rym_repository.dart';
import 'package:proyecto_flutter/domain/model/episode_model.dart';

class HomeProvider extends ChangeNotifier {
  final RYMRepository _rymRepository;
  HomeProvider(this._rymRepository);

  int _currentPage = 0;
  List<Result>? _episodes;
  List<Result>? get episodes => _episodes;

  void setCurrentPage(int index) {
    this._currentPage = index;
    notifyListeners();
  }

  int getCurrentPage() {
    return _currentPage;
  }

  void getEpisodes() async {
    final data = await _rymRepository.getEpisodeList();
    data.fold((l) => {}, (r) => _episodes = r.results);
    notifyListeners();
  }
}
