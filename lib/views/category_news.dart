import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shortify/helper/blog_tile.dart';
import 'package:shortify/helper/news.dart';
import 'package:shortify/helper/spinner.dart';
import 'package:shortify/models/article.dart';

class CategoryView extends StatefulWidget {
  final String categoryName;
  CategoryView({this.categoryName});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF282B30),
        iconTheme: IconThemeData(color: Color(0xffFCBC35)),
        title: Text(
          widget.categoryName,
          style: TextStyle(
            color: Color(0xffFCBC35),
            fontSize: 23,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlogList(categoryName: widget.categoryName.toLowerCase()),
    );
  }
}

// Blog List
class BlogList extends StatefulWidget {
  final String categoryName;
  BlogList({this.categoryName});

  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  PageController myController = PageController(initialPage: 0);
  CategoryNews newsBrain = CategoryNews();
  List<Article> news = [];

  List<BlogTile> getAllNews() {
    return news.map((onenews) {
      return BlogTile(
        title: onenews.title,
        desc: onenews.desc,
        imageUrl: onenews.imageUrl,
        source: onenews.source,
        url: onenews.url,
        date: onenews.date,
      );
    }).toList();
  }

  void getNewsOnl() async {
    await newsBrain.getcategoryNewsOnline(widget.categoryName);
    setState(() {
      news = newsBrain.getCategoryNews;
    });
  }

  @override
  void initState() {
    super.initState();
    getNewsOnl();
  }

  @override
  Widget build(BuildContext context) {
    return news.length == 0
        ? Spinner()
        : PageView(
            controller: myController,
            scrollDirection: Axis.vertical,
            children: getAllNews(),
          );
  }
}
