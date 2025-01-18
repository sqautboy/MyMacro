import 'package:diet_macro/data/models/food_model.dart';

import 'package:diet_macro/presentation/views/food_search/food_search_viewmodel.dart';
import 'package:diet_macro/styles/nutrition_color_set.dart';
import 'package:diet_macro/presentation/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class FoodSearchPage extends StatelessWidget {
  const FoodSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SearchTextField(
              textController: textController,
              onSearch: (foodName) {
                context.read<FoodViewModel>().clearFoods();
                context.read<FoodViewModel>().fetchFoodNutrition(foodName);
              },
            ),
          ),
          Expanded(
            child: Consumer<FoodViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return _buildLoadingState();
                } else if (viewModel.foods.isEmpty) {
                  return Center(child: Text('검색 결과가 없습니다.'));
                } else {
                  return _buildFoodList(viewModel.foods);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: ListTile(
                title: Container(
                  width: double.infinity,
                  height: 18,
                  color: Colors.white,
                ),
                subtitle: Container(
                  padding: const EdgeInsets.only(right: 100),
                  height: 12,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFoodList(List<FoodNutrition> foods) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];
          return ListTile(
            title: Text(
              '${food.name} (${food.servingUnit})',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              'Calories: ${food.calories}kcal  Carb: ${food.carbs}g  Protein: ${food.protein}g  Fat: ${food.fat}g',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
            ).animate().fade(duration: const Duration(milliseconds: 800)),
          );
        },
      ),
    );
  }
}
