import 'package:flutter/material.dart';
import 'package:shortify/Components/homescreen.dart';
import 'package:shortify/helper/data.dart';
import 'package:shortify/models/category_model.dart';
import 'package:shortify/views/categories.dart';

List<CategoryModel> categories = [];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: <Widget>[
        HomeScreen(controller: controller),
        Container(
            child: Categories(categories: categories, controller: controller)),
      ],
    );
  }
}
