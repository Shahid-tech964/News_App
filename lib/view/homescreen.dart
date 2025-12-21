import 'package:flutter/material.dart';
import 'package:news_app/view/detail_screen.dart';
import 'package:news_app/viewmodel/arcticle_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<arcticleViewmodel>().handlestates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<arcticleViewmodel>(
      builder: (ctx, vm, _) {
        if (vm.loading == true) {
          return Center(
            child: CircularProgressIndicator(color: Colors.greenAccent),
          );
        } else if (vm.error.isNotEmpty) {
          return Center(child: Text(vm.error, style: TextStyle(fontSize: 20)));
        } else {
          return ListView.builder(
            itemCount: vm.articles.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => info_screen(
                        name: vm.articles[index].source?.name,
                        author: vm.articles[index].author,
                        imgurl: vm.articles[index].urlToImage,
                        title: vm.articles[index].title,
                        desc: vm.articles[index].description,
                        content: vm.articles[index].content,
                        url: vm.articles[index].url,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            10,
                          ), // 👈 match card radius
                          child: Image.network(
                            vm.articles[index].urlToImage ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox.expand(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                vm.articles[index].title ?? "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // Text(
                              //   snapshot.data![index].description ?? "",
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 16,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
