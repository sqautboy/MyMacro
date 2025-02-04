import 'dart:convert';

import '../../datasources/remote/food_search_api.dart';
import '../../models/food_model.dart';
import 'food_repository.dart';
import '../../../utils/data_process.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodSearchApi _foodSearchApi;

  FoodRepositoryImpl(this._foodSearchApi);

  @override
  Future<List<FoodNutrition>> getFoodNutrition(String foodName) async {
    final responseBody = await _foodSearchApi.fetchFoodNutrition(foodName);
    return _parseFoodNutrition(responseBody, foodName); // foodName 파라미터 추가
  }

  List<FoodNutrition> _parseFoodNutrition(String responseBody, String foodName) {
    // foodName 파라미터 추가
    try {
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);

      // foods 키가 null 인 경우 또는 foodList 가 null 또는 비어있는 경우 처리
      final foodsData = jsonResponse['foods']; // foods 키 값 가져오기
      if (foodsData == null) {
        // foods 키 자체가 null 인 경우
        print('_parseFoodNutrition: No "foods" key in response for foodName: $foodName'); // 로그 추가
        return []; // 빈 리스트 반환
      }

      final foodList = foodsData['food'] as List<dynamic>?; // foodList 가져오기 (Null Safety 적용)
      if (foodList == null || foodList.isEmpty) {
        // foodList 가 null 이거나 비어있는 경우
        print('_parseFoodNutrition: No food data found for foodName: $foodName'); // 로그 추가
        return []; // 빈 리스트 반환
      }

      List<FoodNutrition> foodNutritions = [];

      for (var food in foodList) {
        parseFoodNutrition(food as Map<String, dynamic>, foodNutritions); // 타입 캐스팅 추가
      }
      return foodNutritions;
    } catch (e) {
      print('_parseFoodNutrition: JSON parsing error for foodName: $foodName, error: $e'); // 로그 추가 (foodName 포함)
      return []; // 에러 발생 시 빈 리스트 반환 (안전하게 처리)
    }
  }
}
