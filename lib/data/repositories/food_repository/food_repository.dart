import 'package:diet_macro/data/models/food_model.dart';

abstract class FoodRepository {
  Future<List<FoodNutrition>> fetchFoodNutrition(String foodName);
}
