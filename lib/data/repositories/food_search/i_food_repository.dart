import 'package:diet_macro/data/models/food_model.dart';

abstract class IFoodRepository {
  Future<List<FoodNutrition>> getFoodNutrition(String foodName);
}
