import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/bloc/events/NewsEvent.dart';
import 'package:news_app/bloc/states/NewsState.dart';
import 'package:news_app/model/remote/apiModel/Model.dart';
import 'package:news_app/model/repository/headlineRepo.dart';
import 'package:news_app/model/repository/science_repo.dart';

class Sciencebloc extends Bloc<Newsevent, NewsState> {
  final ScienceRepo _headlineRepo = ScienceRepo();
 Sciencebloc() : super(InitialState()) {
    on<FetchApiNewsEvent>((event, emit) async {
      try {
        List<Articles> list = await _headlineRepo.getresponse();
        emit(Success(data: list));
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}
