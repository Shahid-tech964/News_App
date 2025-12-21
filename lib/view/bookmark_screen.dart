import 'package:news_app/model/hive_model1.dart';
import 'package:news_app/view/detail_screen.dart';
import 'package:news_app/viewmodel/crud_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  Box? box;

  @override
  void initState() {
    box = Hive.box("articles");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CrudViewmodel>(
      builder: (_, vd, _) {
        List<HiveModel1> list = box!.values.toList().cast<HiveModel1>();

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => info_screen(
                      name: list[index].name ?? "",
                      author: list[index].author ?? "",
                      imgurl: list[index].imgurl ?? "",
                      title: list[index].title ?? "",
                      desc: list[index].desc ?? "",
                      content: list[index].content ?? "",
                      url: list[index].url ?? "",
                    ),
                  ),
                );
              },
              child: SizedBox(
                width: double.infinity,
                height: 120,
                child: Card(
                  elevation: 4,
                  child: SizedBox.expand(
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.network(
                            list[index].imgurl ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),

                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            list[index].title ?? "",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            context.read<CrudViewmodel>().deleteitem(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
