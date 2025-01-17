import 'package:diet_macro/core/styles/colors.dart';
import 'package:flutter/material.dart';

abstract class MyTypos {
  static const TextStyle heading1ExtraBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeightExtension.extraBold,
    letterSpacing: -0.06,
  );

  static const TextStyle heading2ExtraBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeightExtension.extraBold,
    letterSpacing: -0.06,
  );

  static const TextStyle heading2Bold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeightExtension.bold,
    letterSpacing: -0.04,
  );

  static const TextStyle heading3ExtraBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightExtension.extraBold,
    letterSpacing: -0.03,
  );

  static const TextStyle heading4ExtraBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightExtension.extraBold,
    letterSpacing: -0.03,
  );

  static const TextStyle title1ExtraBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightExtension.extraBold,
    letterSpacing: -0.03,
  );

  static const TextStyle title1SemiBold = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightExtension.semiBold,
    letterSpacing: -0.03,
  );

  static const TextStyle title2Bold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightExtension.bold,
    letterSpacing: -0.03,
  );

  static const TextStyle title2SemiBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightExtension.semiBold,
    letterSpacing: -0.03,
  );

  static const TextStyle title3ExtraBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightExtension.extraBold,
    letterSpacing: -0.02,
  );

  static const TextStyle title3SemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightExtension.semiBold,
    letterSpacing: -0.02,
  );

  static const TextStyle body1Medium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightExtension.medium,
    letterSpacing: -0.03,
  );

  static const TextStyle body1Regular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightExtension.regular,
    letterSpacing: -0.03,
  );

  static const TextStyle body2SemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightExtension.semiBold,
    letterSpacing: -0.02,
  );

  static const TextStyle body2Bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightExtension.bold,
    letterSpacing: -0.02,
  );

  static const TextStyle body2Regular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightExtension.regular,
    letterSpacing: -0.02,
  );

  static const TextStyle body3Medium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightExtension.medium,
    letterSpacing: -0.01,
  );

  static const TextStyle body3Bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightExtension.bold,
    letterSpacing: -0.01,
  );

  static const TextStyle body4Bold = TextStyle(
    fontSize: 10,
    fontWeight: FontWeightExtension.bold,
    letterSpacing: -0.01,
  );

  static const TextStyle button = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightExtension.bold,
    letterSpacing: -0.01,
  );

  static const TextStyle caption1 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeightExtension.bold,
    letterSpacing: -0.01,
    color: AppColors.grayscale500,
  );

  static const TextStyle caption2 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeightExtension.bold,
    letterSpacing: -0.01,
    color: AppColors.grayscale500,
  );

  static const TextStyle caption3 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeightExtension.regular,
    letterSpacing: -0.01,
    color: AppColors.grayscale500,
  );
}

extension FontWeightExtension on FontWeight {
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;
}
