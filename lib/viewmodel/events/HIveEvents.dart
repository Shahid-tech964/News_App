
abstract class HiveEvent {}

class AddItemEvent extends HiveEvent {
  String? name;

  String? author;

  String? imgurl;

  String? title;

  String? desc;

  String? content;

  String? url;

  AddItemEvent({
    required this.name,
    required this.author,
    required this.imgurl,
    required this.title,
    required this.desc,
    required this.content,
    required this.url,
  });
}

class DeleteitemEvent extends HiveEvent {
  int indx;
  DeleteitemEvent({required this.indx});
}
