import 'package:news_app/model/local/Hive_Model.dart';

class HiveState {}

class EmptyState extends HiveState {}

class LoadItemState extends HiveState {
  List<HiveModel> data = [];
  LoadItemState({required this.data});
}
