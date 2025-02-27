import '../../../widgets/nutrition_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DailyMealInfo extends StatelessWidget {
  const DailyMealInfo({
    super.key,
    required this.mealNumber,
    required this.calories,
    required this.carb,
    required this.protein,
    required this.fat,
    // required DailyData meal,
  });

  final String mealNumber;
  final int calories;
  final int carb;
  final int protein;
  final int fat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: NutritionTile(
        nutrition: mealNumber, // n번째 식사
        status: "$calories kcal / $carb g / $protein g / $fat g", // status format 변경
        percentage: 0, // percentage 0으로 고정
        dividerColor: Colors.grey, // dividerColor 회색으로 변경
      ).animate().fade(duration: const Duration(milliseconds: 200)),
    );
  }
}
