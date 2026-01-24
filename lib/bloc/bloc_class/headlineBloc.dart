import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/bloc/events/headlineEvent.dart';
import 'package:news_app/bloc/states/HeadlineState.dart';
import 'package:news_app/model/remote/apiModel/Model.dart';
import 'package:news_app/model/repository/headlineRepo.dart';

class Headlinebloc extends Bloc<HeadlineEvent, HeadlineState> {
  final HeadlineRepo _headlineRepo = HeadlineRepo();
  Headlinebloc() : super(InitialState()) {
    on<FetchApiHeadlineEvent>((event, emit) async {
      try {
        List<Articles> list = await _headlineRepo.getresponse();
        emit(Success(data: list));
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}
