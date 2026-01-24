import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,

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
                Tab(child: Text("Tab 1")),
                Tab(child: Text("Tab 2")),
                Tab(child: Text("Tab 3")),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("Tab1")),
                  Center(child: Text("Tab2")),
                  Center(child: Text("Tab3")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Tab1 extends StatelessWidget {
//   List<model> data = getData();

//   Tab1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox.expand(
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
//                       child: ClipRRect(
//                         borderRadius: BorderRadiusGeometry.circular(7),
//                         child: Image.network(
//                         data[index].imgurl ?? "",
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         height: double.infinity,

//                         loadingBuilder: (context, child, loadingProgress) {
//                           if (loadingProgress == null) {
//                             return child;
//                           }
//                           return Image.asset(
//                             'assets/images/loading_image.jpg',
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                             height: double.infinity,
//                           );
//                         },
//                       ),
//                       ),
//                     ),

//                     SizedBox(width: 15),
//                     Expanded(
//                       child: Text(
//                         (data[index].title!.length <= 50)
//                             ? data[index].title ?? ""
//                             : '${data[index].title!.substring(0, 70)}............',
//                         // data[index].title??"",
//                         //     maxLines: 3,
//                         //     overflow: TextOverflow.ellipsis,
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
