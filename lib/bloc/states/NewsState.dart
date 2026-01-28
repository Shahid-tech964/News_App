import 'package:news_app/model/remote/apiModel/Model.dart';

abstract class NewsState {}

class InitialState extends NewsState {}

class Success extends NewsState  {
  List<Articles> data = [];
  Success({required this.data});
}


class Error  extends NewsState  {
   String? message;
  Error({required this.message});
}
