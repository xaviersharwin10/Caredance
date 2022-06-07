import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article_model.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {

    final queryParameters = {
      'country': 'us',
      'category': 'job demands',
      'apiKey': '85d03900389949e2997fbd53078c2df5'
    };
    // ac1e8817e8174d118412c533363dd697
    final uri = 'https://newsapi.org/v2/everything?q=naukri&sortBy=popularity&apiKey=ac1e8817e8174d118412c533363dd697';
    final response = await client.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
    print(response.body);
    return articles;

  }
}