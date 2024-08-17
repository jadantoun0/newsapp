import 'package:flutter/material.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/widgets/common/bubble_tab_indicator.dart';
import 'package:newsapp/widgets/search/search_by_keywords.dart';
import 'package:newsapp/widgets/search/search_by_title.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 230, 230, 230),
                ),
                child: TabBar(
                  padding: EdgeInsets.zero,
                  tabAlignment: TabAlignment.fill,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    letterSpacing: 0.3,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  tabs: const [
                    Tab(text: 'Search by Title/Author'),
                    Tab(text: 'Search by Keywords'),
                  ],
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: const BubbleTabIndicator(
                    indicatorHeight: 38.0,
                    padding: EdgeInsets.all(0),
                    indicatorColor: mainColor,
                    tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    indicatorRadius: 30,
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    SearchByTitle(),
                    SearchByKeywords(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
