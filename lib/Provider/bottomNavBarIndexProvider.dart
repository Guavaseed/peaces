import 'package:flutter/material.dart';

class BottomNavBarIndexProvider extends ChangeNotifier{
  int _index = 2;
  bool _isArticle = false;

  int get selectedIndex => _index;
  bool get createArticle => _isArticle;

  void moveIndex(int i){
    _index = i;
    if(i==2){
      _isArticle = true;
    }
    else{
      _isArticle = false;
    }
    notifyListeners();
  }

  void setIndex(int i){
    if(i==2){
      _isArticle = true;
    }
    else{
      _isArticle = false;
    }
    notifyListeners();
  }
}