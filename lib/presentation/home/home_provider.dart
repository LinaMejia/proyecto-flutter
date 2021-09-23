import 'package:flutter/material.dart';
import 'package:proyecto_flutter/domain/rym_repository.dart';

class HomeProvider extends ChangeNotifier {

  final RYMRepository _rymRepository;
  HomeProvider(this._rymRepository);

  int _currentPage = 0;

  void setCurrentPage(int index){
    this._currentPage = index;
    notifyListeners();
  }

  int getCurrentPage(){
    return _currentPage;
  }
}