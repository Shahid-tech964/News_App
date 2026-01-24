import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:news_app/bloc/bloc_class/HiveBloc.dart';
import 'package:news_app/bloc/bloc_class/headlineBloc.dart';

import 'package:news_app/model/local/Hive_Model.dart';
import 'package:news_app/view/HomeScreen/HomeUI.dart';
import 'package:news_app/view/bookmark_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<HiveModel>("HiveArticle");
  Hive.registerAdapter(HiveModelAdapter());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => Headlinebloc()),
        BlocProvider(create: (_) => Hivebloc()),
      ],
      child: MyWidget(),
    ),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  _MyWidgetState();
  int currindx = 0;
  List<Widget> widgets = [HomeScreen(), BookmarkScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PopScope(
        canPop: currindx == 0,
        onPopInvokedWithResult: (_, _) {
          if (currindx != 0) {
            setState(() {
              currindx = 0;
            });
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "News App",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.blue,
          ),
          body: widgets[currindx],

          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: currindx,
              onTap: (indx) {
                setState(() {
                  currindx = indx;
                });
              },
              backgroundColor: Colors.blue,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey[300],
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Setting",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
