import '../../../core/injection/get_it.dart';
import '../../../data/entity/daily_nutrition.dart';
import '../../../data/repository/food_search/food_repository.dart';
import 'package:flutter/material.dart';

class FoodSearchViewModel extends ChangeNotifier {
  final _foodRepository = getIt<FoodRepository>();

  List<DailyNutrition> foods = [];
  bool isLoading = false;

  Future<void> fetchFoodNutrition(String foodName) async {
    isLoading = true;
    notifyListeners(); // 상태 변경 알림

    foods = await _foodRepository.getFoodNutrition(foodName);

    isLoading = false;
    notifyListeners();
  }

  void clearFoods() {
    foods.clear();
    notifyListeners();
  }
}
