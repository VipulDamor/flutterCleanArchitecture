import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:testflutterclean/data/models/news_list/news_list.dart';

class NewsDetails extends StatelessWidget {
  final Articles artical;

  const NewsDetails({super.key, required this.artical});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Details"),
      ),
      body: ListView(
        children: [
          Image.network(
            artical.urlToImage.toString(),
            fit: BoxFit.fill,
          ),
          SizedBox(height: 8.sp),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Text(
              artical.content.toString(),
            ),
          )
        ],
      ),
    );
  }
}
