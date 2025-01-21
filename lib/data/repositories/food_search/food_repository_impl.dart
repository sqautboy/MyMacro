import 'dart:convert';

import 'package:diet_macro/data/datasources/remote/food_search_api.dart';
import 'package:diet_macro/data/models/food_model.dart';
import 'package:diet_macro/data/repositories/food_search/i_food_repository.dart';
import 'package:diet_macro/utils/logic/data_process.dart';

class FoodRepositoryImpl implements IFoodRepository {
  final FoodSearchApi _foodSearchApi;

  FoodRepositoryImpl(this._foodSearchApi);

  @override
  Future<List<FoodNutrition>> getFoodNutrition(String foodName) async {
    final responseBody = await _foodSearchApi.fetchFoodNutrition(foodName);
    return _parseFoodNutrition(responseBody);
  }

  List<FoodNutrition> _parseFoodNutrition(String responseBody) {
    final Map<String, dynamic> jsonResponse = json.decode(responseBody);
    final List<dynamic> foodList = jsonResponse['foods']['food'];

    List<FoodNutrition> foodNutritions = [];

    for (var food in foodList) {
      parseFoodNutrition(food, foodNutritions);
    }
    return foodNutritions;
  }
}
