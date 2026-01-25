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
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(7),
                            child: Image.network(
                              items[index].imgurl ?? "",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),

                        SizedBox(width: 15),
                        Expanded(
                          flex: 2,
                          child: Text(
                            items[index].title ?? "",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              context.read<Hivebloc>().add(
                                DeleteitemEvent(indx: index),
                              );
                            },
                            icon: const Icon(Icons.delete),
                          ),
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
