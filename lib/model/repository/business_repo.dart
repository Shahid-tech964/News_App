import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/remote/apiModel/Model.dart';
import 'package:news_app/model/remote/apiService/bussinessApiService.dart';

class BusinessRepo {
  final Bussinessapiservice _bussinessapiservice = Bussinessapiservice();
  final List<Articles> _list = [];

  Future<List<Articles>> getresponse() async {
    final response = await _bussinessapiservice.response();

    if (response.statusCode == 200) {
      dynamic map = jsonDecode(response.body);

      debugPrint("Debugging ->${map['articles']}");

      for (Map<String, dynamic> i in map['articles']) {
        _list.add(Articles.fromJson(i));
      }

      return _list;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
