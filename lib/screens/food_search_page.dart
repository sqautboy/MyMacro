import 'package:diet_macro/providers/food_provider.dart';
import 'package:diet_macro/utils/color_set.dart';
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
            height: 8,
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

class SearchTextField extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onSearch;

  const SearchTextField({
    super.key,
    required this.textController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            showCursor: false,
            controller: textController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(18),
              prefixIcon: Icon(Icons.search, color: Colors.grey[800]),
              suffixIcon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    onSearch(textController.text);
                  },
                  padding: const EdgeInsets.all(12),
                ),
              ),
              labelText: 'Search',
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
