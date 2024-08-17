import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/utils/network/dio_helper.dart';
import 'package:newsapp/utils/secrets/secrets.dart';

class ArticleService {
  static Future<List<ArticleModel>> getArticles({required int limit}) async {
    try {
      final dio = DioHelper.getDio();
      final response = await dio.get(
          'https://gnews.io/api/v4/top-headlines?apikey=$apiKey&max=$limit');
      List<dynamic> articlesList = response.data?['articles'];
      List<ArticleModel> articles = articlesList
          .map((article) => ArticleModel.fromJson(article))
          .toList();
      return articles;
    } on DioException catch (error) {
      debugPrint(error.response.toString());
      rethrow;
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }

  static Future<List<ArticleModel>> searchForArticles({
    required String keyword,
    required bool byTitleOrAuthor,
  }) async {
    try {
      final dio = DioHelper.getDio();
      late String url;
      url = "https://gnews.io/api/v4/search?q=$keyword&apikey=$apiKey";
      if (byTitleOrAuthor) {
        url += "&in=title";
      }
      final response = await dio.get(url);
      List<dynamic> articlesList = response.data?['articles'];
      List<ArticleModel> articles = articlesList
          .map((article) => ArticleModel.fromJson(article))
          .toList();
      return articles;
    } on DioException catch (error) {
      debugPrint(error.response.toString());
      rethrow;
    } catch (error) {
      debugPrint(error.toString());
      rethrow;
    }
  }
}
