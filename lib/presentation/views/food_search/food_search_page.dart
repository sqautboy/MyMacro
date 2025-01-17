import 'package:diet_macro/providers/food_provider.dart';
import 'package:diet_macro/core/styles/nutrition_color_set.dart';
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
                context.read<FoodProvider>().clearFoods();
                context.read<FoodProvider>().fetchFoodNutritionProvider(foodName);
              },
            ),
          ),
          Expanded(
            child: context.watch<FoodProvider>().isLoading
                ? Padding(
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
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                      itemCount: context.read<FoodProvider>().foods.length,
                      itemBuilder: (context, index) {
                        final food = context.read<FoodProvider>().foods[index];

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
                  ),
          )
        ],
      ),
    );
  }
}
