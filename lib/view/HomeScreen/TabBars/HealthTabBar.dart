import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/bloc_class/healthbloc.dart';
import 'package:news_app/bloc/events/NewsEvent.dart';
import 'package:news_app/bloc/states/NewsState.dart';
import 'package:news_app/model/remote/apiModel/Model.dart';
import 'package:news_app/view/detail_screen.dart';

class Healthtabbar extends StatefulWidget {
  const  Healthtabbar({super.key});

  @override
  State< Healthtabbar> createState() => _HealthtabbarState();
}

class  _HealthtabbarState extends State<Healthtabbar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Healthbloc>().add(FetchApiNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Healthbloc, NewsState>(
      builder: (_, state) {
        if (state is Success) {
          List<Articles> data = state.data;
          return SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => info_screen(
                            name: data[index].source?.name,
                            author: data[index].author,
                            imgurl: data[index].urlToImage,
                            title: data[index].title,
                            desc: data[index].description,
                            content: data[index].content,
                            url: data[index].url,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 130,
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(7),
                                child: Image.network(
                                  data[index].urlToImage ?? "https://dummyimage.com/300x200/cccccc/000000&text=Image+Not+Available",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),

                            SizedBox(width: 15),
                            Expanded(
                              child: Text(
                                data[index].title ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is Error) {
          String? error = state.message;
          return Center(child: Text(error.toString()));
        } else {
          return Container();
        }
      },
    );
  }
}
