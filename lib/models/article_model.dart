import 'package:newsapp/utils/helper/date_utils.dart';

class ArticleModel {
  String title;
  String description;
  String content;
  String url;
  String image;
  String publishedAt;
  SourceModel source;

  ArticleModel({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.source,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      url: json['url'] ?? '',
      image: json['image'] ?? '',
      publishedAt: CustomDateUtils.formatDate(json['publishedAt'] ?? ''),
      source: SourceModel.fromJson(json['source'] ?? {}),
    );
  }
}

class SourceModel {
  String name;
  String url;

  SourceModel({
    required this.name,
    required this.url,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
