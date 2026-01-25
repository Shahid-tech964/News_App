import 'package:flutter/material.dart';
import 'package:news_app/view/HomeScreen/TabBars/BusinessTabBar.dart';
import 'package:news_app/view/HomeScreen/TabBars/EntertainmentTabBar.dart';
import 'package:news_app/view/HomeScreen/TabBars/GeneralTabBar.dart';
import 'package:news_app/view/HomeScreen/TabBars/HealthTabBar.dart';
import 'package:news_app/view/HomeScreen/TabBars/ScienceTabBar.dart';
import 'package:news_app/view/HomeScreen/TabBars/SportsTabBar.dart';
import 'package:news_app/view/HomeScreen/TabBars/TechnologyTabBar.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,

      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.blue,
              dividerColor: Colors.transparent,
              tabs: [
                Tab(child: Text("General")),
                Tab(child: Text("Sport")),
                Tab(child: Text("Technology")),
                 Tab(child: Text("Business")),
                  Tab(child: Text("Health")),
                   Tab(child: Text("Science")),
                    Tab(child: Text("Entertainment")),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  Generaltabbar(),
                 Sportstabbar(),
                 Technologytabbar(),
                 Businesstabbar(),
                 Healthtabbar(),
                 Sciencetabbar(),
                 Entertainmenttabbar()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// class Tab2 extends StatelessWidget {
//   List<model> data = getData();

//   Tab2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.expand(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             return Card(
//               elevation: 3,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(7),
//               ),
//               child: Container(
//                 height: 100,
//                 width: double.infinity,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       height: 100,
//                       width: 130,
//                       child: Image.network(
//                         data[index].imgurl ?? "",
//                         fit: BoxFit.cover,
//                         height: double.infinity,
//                       ),
//                     ),

//                     SizedBox(width: 15),
//                     Expanded(
//                       child: Text(
//                         (data[index].title!.length <= 50)
//                             ? data[index].title ?? ""
//                             : '${data[index].title!.substring(0, 80)}............',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class Tab3 extends StatelessWidget {
//   List<model> data = getData();

//   Tab3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.expand(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: ListView.builder(
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             return Card(
//               elevation: 3,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(7),
//               ),
//               child: Container(
//                 height: 100,
//                 width: double.infinity,
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       height: 100,
//                       width: 130,
//                       child: Image.network(
//                         data[index].imgurl ?? "",
//                         fit: BoxFit.cover,
//                         height: double.infinity,
//                       ),
//                     ),

//                     SizedBox(width: 15),
//                     Expanded(
//                       flex: 2,
//                       child: Text(
//                         (data[index].title!.length <= 50)
//                             ? data[index].title ?? ""
//                             : '${data[index].title!.substring(0, 80)}............',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
