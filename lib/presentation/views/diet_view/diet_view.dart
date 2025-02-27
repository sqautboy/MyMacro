import 'components/daily_meal_info.dart';
import 'components/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/colors/nutrition_color_set.dart';
import '../../widgets/nutrition_tile.dart';
import 'components/progress_indicator.dart';
import 'diet_view_model.dart'; // DailyMealInfo import 추가

class DietView extends StatefulWidget {
  const DietView({super.key});

  @override
  State<DietView> createState() => _DietViewState();
}

class _DietViewState extends State<DietView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<DietViewModel>().loadData());
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DietViewModel>();

    return Scaffold(
      backgroundColor: mainColor,
      floatingActionButton: Consumer<DietViewModel>(
        builder: (context, viewModel, child) => MyFloatingActionButton(dietViewModel: viewModel),
      ),
      body: _buildContent(viewModel),
    );
  }

  // 메인 콘텐츠
  Widget _buildContent(DietViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildIndicatorRow(viewModel),
            const SizedBox(height: 50),
            _buildNutritionTiles(viewModel),
            const SizedBox(height: 30),
            _buildMealInfoList(viewModel), // meal list view 추가
          ],
        ),
      ),
    );
  }

  // // meal list view 추가
  Widget _buildMealInfoList(DietViewModel viewModel) {
    if (viewModel.mealData?.isEmpty ?? true) {
      // mealData 리스트가 비어있는지 확인
      return const Text(
        "No meals added yet",
        style: TextStyle(color: Colors.grey),
        textAlign: TextAlign.center,
      );
    }
    return Column(
      children: viewModel.mealData!.map((meal) {
        return DailyMealInfo(
          mealNumber: 'Meal #${viewModel.mealData!.indexOf(meal) + 1}', // Meal 번호 표시
          calories: meal.calories,
          carb: meal.carb,
          protein: meal.protein,
          fat: meal.fat,
        );
      }).toList(),
    );
  }

  // CircularPercentIndicator Row 두 개 배치
  Widget _buildIndicatorRow(DietViewModel viewModel) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyProgressIndicator(
              percent: viewModel.caloriesPercent,
              progressColor: caloriesColor,
              centerText1: "${viewModel.dailyData.calories}",
              centerText2: "Calories",
            ),
            MyProgressIndicator(
              percent: viewModel.carbPercent,
              progressColor: carbColor,
              centerText1: "${viewModel.dailyData.carb} g",
              centerText2: "Carb",
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyProgressIndicator(
              percent: viewModel.proteinPercent,
              progressColor: proteinColor,
              centerText1: "${viewModel.dailyData.protein} g",
              centerText2: "Protein",
            ),
            MyProgressIndicator(
              percent: viewModel.fatPercent,
              progressColor: fatColor,
              centerText1: "${viewModel.dailyData.fat} g",
              centerText2: "Fat",
            ),
          ],
        ),
      ],
    );
  }

  // NutritionTiles 생성 (daily 영양소 타일)
  Widget _buildNutritionTiles(DietViewModel viewModel) {
    return Column(
      children: [
        _buildNutritionTile(
          nutrition: "Calories",
          currentValue: viewModel.dailyData.calories,
          targetValue: viewModel.targetData.targetCalories,
          dividerColor: const Color.fromARGB(255, 160, 25, 23),
        ),
        _buildNutritionTile(
          nutrition: "Carb",
          currentValue: viewModel.dailyData.carb,
          targetValue: viewModel.targetData.targetCarb,
          dividerColor: const Color.fromARGB(255, 26, 121, 31),
        ),
        _buildNutritionTile(
          nutrition: "Protein",
          currentValue: viewModel.dailyData.protein,
          targetValue: viewModel.targetData.targetProtein,
          dividerColor: const Color.fromARGB(255, 14, 74, 144),
        ),
        _buildNutritionTile(
          nutrition: "Fat",
          currentValue: viewModel.dailyData.fat,
          targetValue: viewModel.targetData.targetFat,
          dividerColor: const Color.fromARGB(255, 124, 86, 14),
        ),
      ],
    );
  }

  // NutritionTile 템플릿
  Widget _buildNutritionTile({
    required String nutrition,
    required int currentValue,
    required int targetValue,
    required Color dividerColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: NutritionTile(
        dividerColor: dividerColor,
        nutrition: nutrition,
        status: "$currentValue / $targetValue",
        percentage: targetValue > 0 ? (currentValue / targetValue * 100).toInt() : 0, // 0이하는 0으로 설정(계산식 수정)
      ).animate().fade(duration: const Duration(milliseconds: 200)),
    );
  }
}
