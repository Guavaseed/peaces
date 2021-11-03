import 'package:flutter/material.dart';

import '../Models/article.dart';
import '../Store/data.dart';

class ArticleProvider extends ChangeNotifier{

  List<Article> articles = Data.dataArticles;

  List<Article> get allArticles => articles;
  int get articleSize => articles.length;

  void addArtcile(Article a){
    articles.insert(0, a);
    notifyListeners();
  }
}