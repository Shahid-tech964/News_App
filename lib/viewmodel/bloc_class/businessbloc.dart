import 'package:bloc/bloc.dart';
import 'package:news_app/viewmodel/events/NewsEvent.dart';
import 'package:news_app/viewmodel/states/NewsState.dart';
import 'package:news_app/model/remote/apiModel/Model.dart';
import 'package:news_app/model/repository/business_repo.dart';

class Businessbloc extends Bloc<Newsevent, NewsState> {
  final BusinessRepo _headlineRepo = BusinessRepo();
  Businessbloc() : super(InitialState()) {
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
