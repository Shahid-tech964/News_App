import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:news_app/viewmodel/bloc_class/AuthBloc/ButtonValidationBloc.dart';
import 'package:news_app/viewmodel/bloc_class/AuthBloc/SignInBloc.dart';
import 'package:news_app/viewmodel/bloc_class/AuthBloc/SignOutBloc.dart';
import 'package:news_app/viewmodel/bloc_class/AuthBloc/SignUpBloc.dart';
import 'package:news_app/viewmodel/bloc_class/AuthBloc/ValidationBloc.dart';
import 'package:news_app/viewmodel/bloc_class/HiveBloc.dart';
import 'package:news_app/viewmodel/bloc_class/businessbloc.dart';
import 'package:news_app/viewmodel/bloc_class/entertainmentbloc.dart';
import 'package:news_app/viewmodel/bloc_class/generalbloc.dart';
import 'package:news_app/viewmodel/bloc_class/headlineBloc.dart';
import 'package:news_app/viewmodel/bloc_class/healthbloc.dart';
import 'package:news_app/viewmodel/bloc_class/sciencebloc.dart';
import 'package:news_app/viewmodel/bloc_class/sportsbloc.dart';
import 'package:news_app/viewmodel/bloc_class/technologybloc.dart';

import 'package:news_app/model/local/Hive_Model.dart';
import 'package:news_app/view/AuthScreens/SignInPage.dart';
import 'package:news_app/view/AuthScreens/SignOutPage.dart';
import 'package:news_app/view/HomeScreen/HomeUI.dart';
import 'package:news_app/view/bookmark_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<HiveModel>("HiveArticle");
  Hive.registerAdapter(HiveModelAdapter());
  await Firebase.initializeApp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => Headlinebloc()),
        BlocProvider(create: (_) => Hivebloc()),
        BlocProvider(create: (_) => Businessbloc()),
        BlocProvider(create: (_) => Healthbloc()),
        BlocProvider(create: (_) => Sciencebloc()),
        BlocProvider(create: (_) => Sportsbloc()),
        BlocProvider(create: (_) => Generalbloc()),
        BlocProvider(create: (_) => Technologybloc()),
        BlocProvider(create: (_) => Entertainmentbloc()),
        BlocProvider(create: (_) => Signoutbloc()),
        BlocProvider(create: (_) => Signupbloc()),
        BlocProvider(create: (_) => SignInBloc()),
        BlocProvider(create: (_) => SignInButtonValidationBloc()),
        BlocProvider(create: (_) => SignUpButtonValidationBloc()),
        BlocProvider(create: (_) => SignINEmailValidationbloc()),
        BlocProvider(create: (_) => SignInPasswordValidationBloc()),
        BlocProvider(create: (_) => SignUpEmailValidationbloc()),
        BlocProvider(create: (_) => SignUpPasswordValidationBloc()),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return LandingPage();
          } else {
            return SignInPage();
          }
        },
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currindx = 0;
  List<Widget> widgets = [HomeScreen(), BookmarkScreen(), SignOut()];
  @override
  Widget build(BuildContext context) {
    return PopScope(
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                icon: Icon(Icons.bookmark),
                label: "BookMark",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Setting",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
