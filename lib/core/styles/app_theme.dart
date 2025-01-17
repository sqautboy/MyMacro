import 'package:diet_macro/core/styles/app_bar_theme.dart';
import 'package:diet_macro/core/styles/color_theme.dart';
import 'package:diet_macro/core/styles/nutrition_color_set.dart';
import 'package:flutter/material.dart';

final ThemeData myLightTheme = ThemeData(
  scaffoldBackgroundColor: mainColor,
  brightness: Brightness.light,
  colorScheme: myColorScheme(),
  appBarTheme: myAppBarTheme(),
);
