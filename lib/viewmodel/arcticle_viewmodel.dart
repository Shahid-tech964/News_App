import 'package:flutter/material.dart';
import 'package:news_app/model/article_repo.dart';
import 'package:news_app/model/articles_model.dart';

class arcticleViewmodel extends ChangeNotifier {
  bool _loading = false;
  List<Articles> _articles = [];
  String _error = "";

  bool get loading => _loading;
  List<Articles> get articles => _articles;
  String get error => _error;

  Future<void> handlestates() async {
    _loading = true;
    notifyListeners();

    try {
      _articles = await response();
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
