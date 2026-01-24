import 'package:http/http.dart';
import 'package:news_app/model/remote/apiModel/Model.dart';

abstract class HeadlineState {}

class InitialState extends HeadlineState{}

class Success extends HeadlineState {
  List<Articles> data = [];
  Success({required this.data});
}


class Error  extends HeadlineState {
   String? message;
  Error({required this.message});
}
