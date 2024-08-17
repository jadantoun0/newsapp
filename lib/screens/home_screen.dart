import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newsapp/providers/home_provider.dart';
import 'package:newsapp/widgets/articles/article_box.dart';
import 'package:newsapp/widgets/articles/article_shimmer_box.dart';
import 'package:newsapp/widgets/common/error_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    if (homeProvider.articles.isNotEmpty || homeProvider.error.isNotEmpty) {
      return;
    }
    homeProvider.fetchHomePage();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: RefreshIndicator.adaptive(
        key: Platform.isAndroid ? null : UniqueKey(),
        onRefresh: () async {
          homeProvider.refetchHomePage();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Latest News',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  homeProvider.error.isNotEmpty
                      ? Center(
                          child: ErrorScreen(
                            errorMessage: homeProvider.error,
                            onTap: () {
                              homeProvider.refetchHomePage();
                            },
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: homeProvider.loading
                              ? 10
                              : homeProvider.articles.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 20);
                          },
                          itemBuilder: (context, index) {
                            if (homeProvider.loading) {
                              return const ArticleShimmerBox();
                            }
                            return ArticleBox(
                              articleModel: homeProvider.articles[index],
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
