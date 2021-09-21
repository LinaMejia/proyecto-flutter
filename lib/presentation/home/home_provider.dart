import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _currentPage = 0;

  void setCurrentPage(int index){
    this._currentPage = index;
    notifyListeners();
  }

  int getCurrentPage(){
    return _currentPage;
  }
}