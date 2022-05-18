import 'dart:convert';

import 'package:flutter_auth/Screens/News/models/article_model.dart';
import 'package:http/http.dart';

class ApiService {
  final endpointUrl = "https://newsapi.org/v2/top-headlines?country=th&category=health&apiKey=643da2518981465f9b6c1b5521c5284e";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endpointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles = body.map((item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ('Unable to get Articles');
    }
  }
}