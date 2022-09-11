import 'package:flutter/material.dart';

final themeLight = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      primary: Color(0xff918AE2),
      seedColor: Colors.red,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Color(0XFF3E3E3F),
      elevation: 0,
    ),
    hintColor: const Color(0xffC0C0C0),
    primaryColor: const Color(0xffFAFAFA),
    backgroundColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xffFAFAFA),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xffE7E6F8),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xffE7E6F8),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusColor: Color(0xffE7E6F8)));
