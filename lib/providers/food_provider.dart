import 'package:diet_macro/data/models/food_model.dart';
import 'package:diet_macro/data/services/api_service.dart';
import 'package:flutter/material.dart';

class FoodProvider extends ChangeNotifier {
  List<FoodNutrition> foods = [];
  bool isLoading = false;

  Future<void> fetchFoodNutritionProvider(String foodName) async {
    isLoading = true;
    notifyListeners(); // 상태 변경 알림

    foods = await fetchFoodNutrition(foodName);

    isLoading = false;
    notifyListeners();
  }

  void clearFoods() {
    foods.clear();
    notifyListeners();
  }
}
