import 'package:diet_macro/data/datasources/remote/%08food_search_api.dart';
import 'package:diet_macro/data/models/food_model.dart';
import 'package:diet_macro/data/repositories/food_repository/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodSearchApi _foodSearchApi;

  FoodRepositoryImpl(this._foodSearchApi);

  @override
  Future<List<FoodNutrition>> fetchFoodNutrition(String foodName) async {
    return await _foodSearchApi.fetchFoodNutrition(foodName);
  }
}
