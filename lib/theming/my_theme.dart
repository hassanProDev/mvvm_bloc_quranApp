import 'package:flutter/material.dart';

class MyTheming {
  static Color ayaColor = Color(0xff242424);
  static Color ayaDarkMode = Color(0xffFACC1D);
  static Color primaryColor = Color(0xffB7935F);
  static Color textColorLight = Color(0xff242424);
  static Color textDarkMode = Color(0xffF8F8F8);
  static Color viewColor = Color(0xffF8F8F8);
  static Color borderColor = Color(0xffB7935F);
  static String bgImg = 'assets/images/bg3.png';
  static String appName = 'اسلامي';
  static final ThemeData themeApp = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: textColorLight,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: textColorLight,
      ),
      headline2: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: textColorLight,
      ),
      headline3: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: ayaColor,
      ),
      headline4: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ayaColor,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: textDarkMode,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: textDarkMode,
      ),
      headline2: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: textDarkMode,
      ),
      headline3: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: ayaDarkMode,
      ),
      headline4: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ayaDarkMode,
      ),
    ),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
