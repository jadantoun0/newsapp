import 'package:flutter/material.dart';
import 'package:newsapp/utils/constants/constants.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
  useMaterial3: true,
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: mainColor, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[500]!, width: 1.0),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[500]!, width: 1.0),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    scrolledUnderElevation: 0,
    iconTheme: IconThemeData(
      color: mainColor,
    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 21,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.05,
    ),
  ),
);
