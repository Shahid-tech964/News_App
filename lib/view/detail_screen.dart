import 'package:flutter/material.dart';
import 'package:news_app/viewmodel/bloc_class/HiveBloc.dart';
import 'package:news_app/viewmodel/events/HIveEvents.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class info_screen extends StatelessWidget {
  String? name;
  String? author;
  String? imgurl;
  String? title;
  String? desc;
  String? content;
  String? url;

  info_screen({
    super.key,
    required this.name,
    required this.author,
    required this.imgurl,
    required this.title,
    required this.desc,
    required this.content,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {
              context.read<Hivebloc>().add(
                AddItemEvent(
                  name: name,
                  author: author,
                  imgurl: imgurl,
                  title: title,
                  desc: desc,
                  content: content,
                  url: url,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 220,
                width: double.infinity,

                child: Card(
                  elevation: 5,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(imgurl ?? "", fit: BoxFit.cover),
                  ),
                ),
              ),

              SizedBox(height: 10),

              Text(
                title ?? "",
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),

              SizedBox(height: 5),

              Text(
                "${author ?? "Not Available"},${name ?? "Not Available"}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,

                  decoration: TextDecoration.none,
                ),
              ),

              SizedBox(height: 15),

              Text(
                desc ?? "",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,

                  decoration: TextDecoration.none,
                ),
              ),

              SizedBox(height: 10),

              Text(
                content ?? "",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,

                  decoration: TextDecoration.none,
                ),
              ),

              SizedBox(height: 2),

              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(url ?? ""));
                },
                child: Text(
                  "Read Full Article ↗︎",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
