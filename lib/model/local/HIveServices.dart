import 'package:hive/hive.dart';
import 'package:news_app/model/local/Hive_Model.dart';
import 'package:news_app/model/remote/apiModel/Model.dart';

class HiveService {
  static const String _boxName = 'HiveArticle';
  final Box _box = Hive.box<HiveModel>(_boxName);

  List<HiveModel> get getItems => _box.values.cast<HiveModel>().toList() ;

  Future<void> addArticle(HiveModel hivemodel) async {
    await _box.add(hivemodel);
  }

  Future<void> deleteArticle(int index) async {
    await _box.deleteAt(index);
  }
}
