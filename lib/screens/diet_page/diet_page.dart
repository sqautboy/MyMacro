import 'package:diet_macro/screens/diet_page/floating_button.dart';
import 'package:diet_macro/screens/diet_page/progress_indicator.dart';
import 'package:diet_macro/widgets/nutrition_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:diet_macro/providers/diet_provider.dart';
import 'package:diet_macro/utils/color_set.dart';

class DietPage extends StatefulWidget {
  const DietPage({super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  @override
  void initState() {
    super.initState();
    context.read<DietProvider>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    // super.build(context);

    final dietProvider = context.watch<DietProvider>();
    final dietProviderRead = context.read<DietProvider>();

    return Scaffold(
      backgroundColor: mainColor,
      floatingActionButton: MyFloatingActionButton(dietProvider: dietProviderRead),
      body: dietProvider.loading ? const Center(child: CircularProgressIndicator()) : _buildContent(dietProviderRead),
    );
  }

  // 메인 콘텐츠
  Widget _buildContent(DietProvider dietProviderRead) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildIndicatorRow(dietProviderRead),
            const SizedBox(height: 50),
            _buildNutritionTiles(dietProviderRead),
          ],
        ),
      ),
    );
  }

  // CircularPercentIndicator Row 두 개 배치
  Widget _buildIndicatorRow(DietProvider dietProviderRead) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyProgressIndicator(
              percent: dietProviderRead.caloriesPercent,
              progressColor: caloriesColor,
              centerText1: "${dietProviderRead.dailyData.calories}",
              centerText2: "Calories",
            ),
            MyProgressIndicator(
              percent: dietProviderRead.carbPercent,
              progressColor: carbColor,
              centerText1: "${dietProviderRead.dailyData.carb} g",
              centerText2: "Carb",
            ),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MyProgressIndicator(
              percent: dietProviderRead.proteinPercent,
              progressColor: proteinColor,
              centerText1: "${dietProviderRead.dailyData.protein} g",
              centerText2: "Protein",
            ),
            MyProgressIndicator(
              percent: dietProviderRead.fatPercent,
              progressColor: fatColor,
              centerText1: "${dietProviderRead.dailyData.fat} g",
              centerText2: "Fat",
            ),
          ],
        ),
      ],
    );
  }

  // NutritionTiles 생성
  Widget _buildNutritionTiles(DietProvider dietProviderRead) {
    return Column(
      children: [
        _buildNutritionTile(
          nutrition: "Calories",
          currentValue: dietProviderRead.dailyData.calories,
          targetValue: dietProviderRead.targetData.targetCalories,
          dividerColor: const Color.fromARGB(255, 160, 25, 23),
        ),
        _buildNutritionTile(
          nutrition: "Carb",
          currentValue: dietProviderRead.dailyData.carb,
          targetValue: dietProviderRead.targetData.targetCarb,
          dividerColor: const Color.fromARGB(255, 26, 121, 31),
        ),
        _buildNutritionTile(
          nutrition: "Protein",
          currentValue: dietProviderRead.dailyData.protein,
          targetValue: dietProviderRead.targetData.targetProtein,
          dividerColor: const Color.fromARGB(255, 14, 74, 144),
        ),
        _buildNutritionTile(
          nutrition: "Fat",
          currentValue: dietProviderRead.dailyData.fat,
          targetValue: dietProviderRead.targetData.targetFat,
          dividerColor: const Color.fromARGB(255, 124, 86, 14),
        ),
      ],
    );
  }

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
        percentage: (currentValue / targetValue * 100).toInt(),
      ).animate().fade(duration: const Duration(milliseconds: 200)),
    );
  }
}
