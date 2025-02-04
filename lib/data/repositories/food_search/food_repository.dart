import '../../models/food_model.dart';

abstract interface class FoodRepository {
  Future<List<FoodNutrition>> getFoodNutrition(String foodName);
}
