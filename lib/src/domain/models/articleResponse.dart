import 'dart:convert';
import 'Article.dart';

ArticleResponse articleResponseFromJson(String str) =>
    ArticleResponse.fromJson(json.decode(str));

String articleResponseToJson(ArticleResponse data) =>
    json.encode(data.toJson());

class ArticleResponse {
  String status;
  int totalResult;
  List<Article> articles;

  ArticleResponse({
    required this.status,
    required this.totalResult,
    required this.articles,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      ArticleResponse(
        status: json["status"],
        totalResult: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResult": totalResult,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}
