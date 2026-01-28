import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/events/NewsEvent.dart';
import 'package:news_app/bloc/states/NewsState.dart';
import 'package:news_app/model/remote/apiModel/Model.dart';
import 'package:news_app/model/repository/sports_repo.dart';

class Sportsbloc extends Bloc<Newsevent,NewsState> {
  final SportsRepo _headlineRepo = SportsRepo();
 Sportsbloc() : super(InitialState()) {
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
