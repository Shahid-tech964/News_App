import 'package:hive/hive.dart';
part 'hive_model1.g.dart';

@HiveType(typeId: 0)
class HiveModel1 {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? author;

  @HiveField(2)
  String? imgurl;

  @HiveField(3)
  String? title;

  @HiveField(4)
  String? desc;

  @HiveField(5)
  String? content;

  @HiveField(6)
  String? url;

  HiveModel1({
    required this.name,
    required this.author,
    required this.imgurl,
    required this.title,
    required this.desc,
    required this.content,
    required this.url,
  });
}
