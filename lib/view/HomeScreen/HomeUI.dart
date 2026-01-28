import 'package:flutter/material.dart';
import 'package:news_app/view/HomeScreen/Slider.dart';
import 'package:news_app/view/HomeScreen/TabBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: Column(
          children: [
            Expanded(
              child: SizedBox.expand(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding( padding: EdgeInsetsGeometry.only(left: 10), child: Text("Top HeadLines", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))),

                    Expanded(child: Image_Slider()),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Expanded(flex: 2, child: CustomTabBar()),
          ],
        ),
      ),
    );
  }
}
