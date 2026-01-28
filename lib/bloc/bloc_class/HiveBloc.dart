import 'package:bloc/bloc.dart';

import 'package:news_app/bloc/events/HIveEvents.dart';

import 'package:news_app/bloc/states/HiveState.dart';
import 'package:news_app/model/local/Hive_Model.dart';

import 'package:news_app/model/repository/HiveRepo.dart';

class Hivebloc extends Bloc<HiveEvent, HiveState> {
  final HiveRepo _hiveRepo = HiveRepo();
  List<HiveModel> _hiveitems = [];

  Hivebloc() : super(EmptyState()) {
    on<AddItemEvent>((event, emit) async {
      await _hiveRepo.additem(
        HiveModel(
          name: event.name,
          author: event.author,
          imgurl: event.imgurl,
          title: event.title,
          desc: event.desc,
          content: event.content,
          url: event.url,
        ),
      );
      _hiveitems = _hiveRepo.items;
      emit(LoadItemState(data: _hiveitems));
    });

    on<DeleteitemEvent>((event, emit) async {
      await _hiveRepo.deleteItem(event.indx);
      _hiveitems = _hiveRepo.items;
      emit(LoadItemState(data: _hiveitems));
    });
  }
}
