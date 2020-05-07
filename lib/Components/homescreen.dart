import 'package:flutter/material.dart';
import 'package:shortify/helper/blog_tile.dart';
import 'package:shortify/helper/news.dart';
import 'package:shortify/helper/spinner.dart';
import 'package:shortify/models/article.dart';

class HomeScreen extends StatelessWidget {
  final PageController controller;
  HomeScreen({this.controller});

  final PageController myController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF282B30),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              controller.animateToPage(
                1,
                duration: Duration(milliseconds: 800),
                curve: Curves.ease,
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xffFCBC35),
            ),
            label: Text(''),
          )
        ],
        title: Text(
          'Shortify',
          style: TextStyle(
            color: Color(0xffFCBC35),
            fontSize: 23,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlogList(),
    );
  }
}

// Blog List
class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  PageController myController = PageController(initialPage: 0);
  News newsBrain = News();
  List<Article> news = [];

  void printNews() {
    print(newsBrain.getNews);
  }

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
    await newsBrain.getNewsOnline();
    setState(() {
      news = newsBrain.getNews;
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
