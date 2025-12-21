import 'dart:convert';

import 'package:flutter/material.dart';

import 'articles_model.dart';
import 'package:http/http.dart' as http;

Future<List<Articles>> response() async {
  List<Articles> list = [];
  String url =
      "https://newsapi.org/v2/top-headlines?sources=bbc-news,cnn,techcrunch&apiKey=ed5c331151a14883aa53146b3d542d0f";

  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    dynamic map = jsonDecode(response.body);

    debugPrint("Debugging ->${map['articles']}");

  
    for (Map<String, dynamic> i in map['articles']) {
      list.add(Articles.fromJson(i));
    }

    return list;
  } else {
    throw Exception("Something went wrong"); 
  }
}
