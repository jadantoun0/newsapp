import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/services/article_service.dart';
import 'package:newsapp/utils/exceptions/dio_socket_exception.dart';

class HomeProvider extends ChangeNotifier {
  int limit = 10;
  List<ArticleModel> articles = [];
  bool loading = true;
  String error = "";

  Future fetchHomePage() async {
    // if fetched, dont fetch
    try {
      List<ArticleModel> newArticles =
          await ArticleService.getArticles(limit: limit);
      articles = newArticles;
    } on DioSocketException {
      error = 'No internet connection!';
    } catch (err) {
      error = 'An unexpected error occured!';
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future refetchHomePage() async {
    // if fetched, dont fetch
    loading = true;
    error = '';

    notifyListeners();
    try {
      List<ArticleModel> newArticles =
          await ArticleService.getArticles(limit: limit);
      articles = newArticles;
    } on DioSocketException {
      error = 'No internet connection!';
    } catch (err) {
      error = 'An unexpected error occured!';
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
