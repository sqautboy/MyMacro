import 'package:diet_macro/data/models/food_model.dart';
import 'package:diet_macro/data/repositories/food_search/i_food_repository.dart';
import 'package:flutter/material.dart';

class FoodViewModel extends ChangeNotifier {
  final IFoodRepository foodRepository;
  List<FoodNutrition> foods = [];
  bool isLoading = false;

  FoodViewModel({required this.foodRepository});

  Future<void> fetchFoodNutrition(String foodName) async {
    isLoading = true;
    notifyListeners(); // 상태 변경 알림

    foods = await foodRepository.getFoodNutrition(foodName);

    isLoading = false;
    notifyListeners();
  }

  void clearFoods() {
    foods.clear();
    notifyListeners();
  }
}
