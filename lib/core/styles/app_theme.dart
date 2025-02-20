import 'app_bar_theme.dart';
import 'colors/color_theme.dart';
import 'colors/nutrition_color_set.dart';
import 'package:flutter/material.dart';

final ThemeData myLightTheme = ThemeData(
  scaffoldBackgroundColor: mainColor,
  brightness: Brightness.light,
  colorScheme: myColorScheme(),
  appBarTheme: myAppBarTheme(),
);
