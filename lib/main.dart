import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:news_app/model/hive_model1.dart';
import 'package:news_app/view/bookmark_screen.dart';
import 'package:news_app/view/homescreen.dart';
import 'package:news_app/viewmodel/arcticle_viewmodel.dart';
import 'package:news_app/viewmodel/crud_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("articles");
  Hive.registerAdapter(HiveModel1Adapter());

  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int index = 0;
  List<Widget> screens = [HomeWidget(), BookmarkScreen()];
  _MyappState();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => arcticleViewmodel()),
        ChangeNotifierProvider(create: (context) => CrudViewmodel()),
      ],

      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "News App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.blue,
          ),

          body: SizedBox.expand(child: screens[index]),

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (ind) {
              index = ind;

              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outline),
                label: "BookMark",
              ),
            ],
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
