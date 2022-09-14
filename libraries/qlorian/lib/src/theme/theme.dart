import 'package:flutter/material.dart';

final themeLight = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      surface: const Color(0xffFFFFFF),
      primary: const Color(0xff918AE2),
      seedColor: Colors.red,
    ),
    scaffoldBackgroundColor: const Color(0xffFAFAFA),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xffFAFAFA),
      foregroundColor: Color(0XFF3E3E3F),
      elevation: 0,
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff565656),
        ),
        headline2: TextStyle(fontSize: 16, color: Color(0xffC4C4C4)),
        headline3: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xffB9B9B9)),
        headline4: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff6E6E6E)),
        headline5: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        headline6: TextStyle(
            fontSize: 14,
            color: Color(0xff9F9F9F),
            fontWeight: FontWeight.w500)),
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
        focusColor: const Color(0xffE7E6F8)));
