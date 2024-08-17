import 'package:flutter/material.dart';
import 'package:newsapp/models/article_model.dart';
import 'package:newsapp/services/article_service.dart';
import 'package:newsapp/utils/exceptions/dio_socket_exception.dart';

class SearchProvider extends ChangeNotifier {
  bool titleLoading = false;
  bool keywordLoading = false;

  String titleError = "";
  String keywordError = "";

  List<ArticleModel> titleArticles = [];
  List<ArticleModel> keywordArticles = [];

  String lastTitleSearch = "";
  String lastKeywordSearch = "";

  Future searchByTitle(String keyword) async {
    titleLoading = true;
    titleError = '';

    notifyListeners();

    try {
      List<ArticleModel> newArticles = await ArticleService.searchForArticles(
        keyword: keyword,
        byTitleOrAuthor: true,
      );
      titleArticles = newArticles;
      lastTitleSearch = keyword;
    } on DioSocketException {
      titleError = 'No internet connection!';
    } catch (err) {
      titleError = 'An unexpected error occured!';
    } finally {
      titleLoading = false;
      notifyListeners();
    }
  }

  Future searchByKeyword(String keyword) async {
    keywordLoading = true;
    keywordError = '';

    notifyListeners();

    try {
      List<ArticleModel> newArticles = await ArticleService.searchForArticles(
        keyword: keyword,
        byTitleOrAuthor: false,
      );
      keywordArticles = newArticles;
      lastKeywordSearch = keyword;
    } on DioSocketException {
      keywordError = 'No internet connection!';
    } catch (err) {
      keywordError = 'An unexpected error occured!';
    } finally {
      keywordLoading = false;
      notifyListeners();
    }
  }
}
