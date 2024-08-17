import 'package:flutter/material.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/screens/search_screen.dart';
import 'package:newsapp/utils/constants/constants.dart';
import 'package:newsapp/widgets/common/inkwell_with_opacity.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
        surfaceTintColor: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey[300]!),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildMaterialButton(
                  0,
                  Icons.home,
                  'Home',
                ),
                buildMaterialButton(
                  1,
                  Icons.search,
                  'Search',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMaterialButton(int index, IconData icon, String label) {
    return SizedBox(
      width: 70,
      child: Center(
        child: Stack(
          children: [
            Align(
              child: InkwellWithOpacity(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          icon,
                          color: _selectedIndex == index
                              ? mainColor
                              : Colors.grey[600],
                          size: 27,
                        ),
                      ),
                      Center(
                        child: Text(
                          label,
                          style: TextStyle(
                            color: _selectedIndex == index
                                ? mainColor
                                : Colors.grey[600],
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
