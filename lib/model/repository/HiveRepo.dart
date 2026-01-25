import 'package:news_app/model/local/HIveServices.dart';
import 'package:news_app/model/local/Hive_Model.dart';

class HiveRepo {
  final HiveService _hiveService = HiveService();

  List<HiveModel> get items => _hiveService.getItems;

  Future<void> additem(HiveModel hivemodel) async {
    await _hiveService.addArticle(hivemodel);
  }

  Future<void> deleteItem(int index) async {
    await _hiveService.deleteArticle(index);
  }
}
