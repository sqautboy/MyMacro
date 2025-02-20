import 'colors.dart';
import 'package:flutter/material.dart';

ColorScheme myColorScheme() {
  return const ColorScheme.light(
    primary: AppColors.grayscale100,
    // onPrimary: AppColors.grayscale100,,
    brightness: Brightness.light,
  );
}
