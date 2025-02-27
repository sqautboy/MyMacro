import '../../entity/daily_nutrition.dart';

abstract interface class FoodRepository {
  Future<List<DailyNutrition>> getFoodNutrition(String foodName);
}
