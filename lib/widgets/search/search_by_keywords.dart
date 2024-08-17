import 'package:flutter/cupertino.dart';
import 'package:newsapp/providers/search_provider.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/widgets/articles/article_box.dart';
import 'package:newsapp/widgets/common/error_screen.dart';
import 'package:newsapp/widgets/search/search_textfield.dart';
import 'package:provider/provider.dart';

class SearchByKeywords extends StatefulWidget {
  const SearchByKeywords({super.key});

  @override
  State<SearchByKeywords> createState() => _SearchByKeywordsState();
}

class _SearchByKeywordsState extends State<SearchByKeywords> {
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 5),
            SearchTextField(
              hintText: 'Search by Keywords',
              onSubmitted: (value) {
                searchProvider.searchByKeyword(value);
              },
            ),
            searchProvider.keywordLoading
                ? const CupertinoActivityIndicator(color: mainColor)
                : searchProvider.keywordError.isNotEmpty
                    ? ErrorScreen(errorMessage: searchProvider.keywordError)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (searchProvider.lastKeywordSearch.isNotEmpty)
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                '${searchProvider.keywordArticles.length} results for "${searchProvider.lastKeywordSearch}"',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          if (searchProvider.lastKeywordSearch.isNotEmpty &&
                              searchProvider.keywordArticles.isEmpty)
                            const Text('No results found'),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: searchProvider.keywordArticles.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 20);
                            },
                            itemBuilder: (context, index) {
                              return ArticleBox(
                                articleModel:
                                    searchProvider.keywordArticles[index],
                              );
                            },
                          ),
                        ],
                      )
          ],
        ),
      ),
    );
  }
}
