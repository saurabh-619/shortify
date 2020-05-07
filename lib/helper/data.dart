import 'package:shortify/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [
    CategoryModel(imageUrl: 'assets/bussiness.svg', categoryName: 'Business'),
    CategoryModel(
        imageUrl: 'assets/entertainment.svg', categoryName: 'Entertainment'),
    CategoryModel(imageUrl: 'assets/general.svg', categoryName: 'General'),
    CategoryModel(imageUrl: 'assets/health.svg', categoryName: 'Health'),
    CategoryModel(imageUrl: 'assets/science.svg', categoryName: 'Science'),
    CategoryModel(imageUrl: 'assets/sports.svg', categoryName: 'Sport'),
    CategoryModel(
        imageUrl: 'assets/electronics.svg', categoryName: 'Technology'),
  ];

  return category;
}
