import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bloc_class/HiveBloc.dart';
import 'package:news_app/bloc/events/HIveEvents.dart';
import 'package:news_app/bloc/states/HiveState.dart';
import 'package:news_app/model/local/Hive_Model.dart';

import 'package:news_app/view/detail_screen.dart';

import 'package:flutter/material.dart';


class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Hivebloc, HiveState>(
      builder: (_, state) {
        if (state is EmptyState) {
          return const SizedBox.expand(
            child: Center(child: Text("You don’t add anything till now")),
          );
        } else if (state is LoadItemState) {
          final List<HiveModel> items = state.data;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => info_screen(
                        name: items[index].name ?? "",
                        author: items[index].author ?? "",
                        imgurl: items[index].imgurl ?? "",
                        title: items[index].title ?? "",
                        desc: items[index].desc ?? "",
                        content: items[index].content ?? "",
                        url: items[index].url ?? "",
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 120,
                  child: Card(
                    elevation: 4,
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.network(
                            items[index].imgurl ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            items[index].title ?? "",
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<Hivebloc>().add(
                              DeleteitemEvent(indx: index)
                            );
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
