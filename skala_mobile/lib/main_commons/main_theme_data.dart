
import 'package:flutter/material.dart';
import 'package:skala_mobile/main_commons/main_color_data.dart';
class MainThemeData {
  factory MainThemeData() {
    return _mainThemeData;
  }

  MainThemeData._internal();

  static final MainThemeData _mainThemeData = MainThemeData._internal();

  final ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: MainColorData.primary,
    scaffoldBackgroundColor: MainColorData.primaryLight,
    fontFamily: 'SF Pro Display',
  );

  final ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primaryColor: MainColorData.primaryDark,
    scaffoldBackgroundColor: MainColorData.primaryDark,
    fontFamily: 'SF Pro Display',
  );
}