import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_app/model/articles_model.dart';
import 'package:news_app/model/hive_model1.dart';

class CrudViewmodel extends ChangeNotifier {
  void additems(
    String? Name,
    String? Author,
    String? Imgurl,
    String? Title,
    String? Desc,
    String? Content,
    String? Url,
  ) {
    Box box = Hive.box("articles");
    box.add(
      HiveModel1(
        name: Name,
        author: Author,
        imgurl: Imgurl,
        title: Title,
        desc: Desc,
        content: Content,
        url: Url,
      ),
    );
    notifyListeners();
  }

  void deleteitem(int index) {
    Box box = Hive.box("articles");
    box.deleteAt(index);
    notifyListeners();
  }
}
