import 'package:diet_macro/models/food_model.dart';

parseFoodNutrition(Map<String, dynamic> food, List foodNutritions) {
  String description = food['food_description'];

  // "Per" 뒤에 오는 서빙 양 추출
  String servingUnit = description.split(' - ')[0].substring(4).trim();

  List<String> parts = description.split(' - ')[1].split(' | ');

  // 데이터 가공 후 추가
  foodNutritions.add(
    FoodNutrition(
      name: food['food_name'], // food_name 추가
      calories: int.parse(parts[0].split(': ')[1].replaceAll('kcal', '')),
      fat: double.parse(parts[1].split(': ')[1].replaceAll('g', '')).round(), // 정수형 변환
      carbs: double.parse(parts[2].split(': ')[1].replaceAll('g', '')).round(), // 정수형 변환
      protein: double.parse(parts[3].split(': ')[1].replaceAll('g', '')).round(), // 정수형 변환
      servingUnit: servingUnit,
    ),
  );
}
