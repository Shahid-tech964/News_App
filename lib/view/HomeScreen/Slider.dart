import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/viewmodel/bloc_class/headlineBloc.dart';
import 'package:news_app/viewmodel/events/NewsEvent.dart';
import 'package:news_app/viewmodel/states/NewsState.dart';
import 'package:news_app/model/remote/apiModel/Model.dart';
import 'package:news_app/view/detail_screen.dart';

class Image_Slider extends StatefulWidget {
  const Image_Slider({super.key});

  @override
  State<Image_Slider> createState() => _Image_SliderState();
}

class _Image_SliderState extends State<Image_Slider> {
  int currentIndx = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Headlinebloc>().add(FetchApiNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: BlocBuilder<Headlinebloc, NewsState>(
        builder: (_, state) {
          if (state is Success) {
            List<Articles> data = state.data;

            return  Stack(
                children: [
                  CarouselSlider(
                    items: data.take(8).map((item) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => info_screen(
                                name: item.source?.name,
                                author: item.author,
                                imgurl: item.urlToImage,
                                title: item.title,
                                desc: item.description,
                                content: item.content,
                                url: item.url,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(10),
                                child: Image.network(
                                  item.urlToImage ?? "https://dummyimage.com/300x200/cccccc/000000&text=Image+Not+Available",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                left: 12,
                                bottom: 16, // 👈 ABOVE DOTS
                                right: 12,
                                child: Text(
                                  item.title ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: double.infinity,
                      autoPlay: true,
                      viewportFraction: 0.8,
                      autoPlayCurve: Curves.easeOutCubic,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndx = index;
                        });
                      },
                    ),
                  ),

                  Positioned(
                    bottom: 5, // 👈 move dots UP (increase value = more up)
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(data.take(8).length, (index) {
                        return Container(
                          margin: const EdgeInsets.all(4),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndx == index
                                ? Colors.blue
                                : Colors.white,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              );
            
          } else if (state is Error) {
            return Center(child: Text(state.message ?? ""));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
