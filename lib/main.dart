import 'package:flutter/material.dart';
import 'package:newsapp/providers/home_provider.dart';
import 'package:newsapp/providers/search_provider.dart';
import 'package:newsapp/screens/layout_screen.dart';
import 'package:newsapp/utils/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (final context) => HomeProvider()),
        ChangeNotifierProvider(create: (final context) => SearchProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: theme,
        home: const LayoutScreen(),
      ),
    );
  }
}
