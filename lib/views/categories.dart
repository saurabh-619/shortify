import 'package:flutter/material.dart';
import 'package:shortify/models/category_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shortify/views/category_news.dart';

class Categories extends StatelessWidget {
  final List<CategoryModel> categories;
  final PageController controller;

  final PageController myController = PageController(initialPage: 1);
  Categories({this.categories, this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF282B30),
        title: Text(
          'Categories',
          style: TextStyle(
            color: Color(0xffFCBC35),
            fontSize: 23,
          ),
        ),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              controller.animateToPage(
                0,
                duration: Duration(milliseconds: 900),
                curve: Curves.ease,
              );
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xffFCBC35),
            ),
            label: Text(''),
          )
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xff282B30),
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 60,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryView(
                              categoryName: categories[index].categoryName,
                            )));
              },
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Color(0xeeFCBC35),
                  elevation: 5,
                  margin: EdgeInsets.only(bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        categories[index].imageUrl,
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        categories[index].categoryName,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: categories.length,
        ),
      ),
    );
  }
}
