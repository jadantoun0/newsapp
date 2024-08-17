import 'package:flutter/cupertino.dart';
import 'package:newsapp/providers/search_provider.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/widgets/articles/article_box.dart';
import 'package:newsapp/widgets/common/error_screen.dart';
import 'package:newsapp/widgets/search/search_textfield.dart';
import 'package:provider/provider.dart';

class SearchByTitle extends StatefulWidget {
  const SearchByTitle({super.key});

  @override
  State<SearchByTitle> createState() => _SearchByTitleState();
}

class _SearchByTitleState extends State<SearchByTitle> {
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
              hintText: 'Search by Title/Author',
              onSubmitted: (value) {
                searchProvider.searchByTitle(value);
              },
            ),
            searchProvider.titleLoading
                ? const CupertinoActivityIndicator(color: mainColor)
                : searchProvider.titleError.isNotEmpty
                    ? ErrorScreen(errorMessage: searchProvider.titleError)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (searchProvider.lastTitleSearch.isNotEmpty)
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                '${searchProvider.titleArticles.length} results for "${searchProvider.lastTitleSearch}"',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          if (searchProvider.lastTitleSearch.isNotEmpty &&
                              searchProvider.titleArticles.isEmpty)
                            const Text('No results found'),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: searchProvider.titleArticles.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 20);
                            },
                            itemBuilder: (context, index) {
                              return ArticleBox(
                                articleModel:
                                    searchProvider.titleArticles[index],
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
