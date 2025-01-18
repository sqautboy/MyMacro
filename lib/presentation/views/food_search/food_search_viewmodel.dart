import 'package:diet_macro/data/models/food_model.dart';
import 'package:diet_macro/data/repositories/food_repository/food_repository.dart';
import 'package:flutter/material.dart';

class FoodViewModel extends ChangeNotifier {
  final FoodRepository foodRepository;
  List<FoodNutrition> foods = [];
  bool isLoading = false;

  FoodViewModel({required this.foodRepository});

  Future<void> fetchFoodNutrition(String foodName) async {
    isLoading = true;
    notifyListeners(); // 상태 변경 알림

    foods = await foodRepository.fetchFoodNutrition(foodName);

    isLoading = false;
    notifyListeners();
  }

  void clearFoods() {
    foods.clear();
    notifyListeners();
  }
}
