import 'dart:convert';

import 'package:shortify/models/article.dart';
import 'package:http/http.dart' as http;

class News {
  List<Article> articles = [];

  String url =
      'https://newsapi.org/v2/top-headlines?country=in&pageSize=100&apiKey=8b91e630bbb9446a93a7390284b6ab57';

  Future<void> getNewsOnline() async {
    var response = await http.get(url);
    var data = await jsonDecode(response.body);
    if (data['status'] == 'ok') {
      List<Article> newList = await data['articles'].map<Article>((article) {
        return Article(
          title: article['title'],
          desc: article['description'],
          imageUrl: article['urlToImage'],
          date: article['publishedAt'],
          source: article['source']['name'],
          url: article['url'],
        );
      }).toList();
      articles = newList;
    } else {
      print(data);
    }
  }

  List<Article> get getNews {
    return articles;
  }
}

class CategoryNews {
  List<Article> articles = [];

  Future<void> getcategoryNewsOnline(String category) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&pageSize=100&apiKey=8b91e630bbb9446a93a7390284b6ab57';

    var response = await http.get(url);
    var data = await jsonDecode(response.body);
    if (data['status'] == 'ok') {
      List<Article> newList = await data['articles'].map<Article>((article) {
        return Article(
          title: article['title'],
          desc: article['description'],
          imageUrl: article['urlToImage'],
          date: article['publishedAt'],
          source: article['source']['name'],
          url: article['url'],
        );
      }).toList();
      articles = newList;
    } else {
      print(data);
    }
  }

  List<Article> get getCategoryNews {
    return articles;
  }
}
