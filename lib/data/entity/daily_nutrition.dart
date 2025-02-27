// 음식 정보 데이터 모델
class DailyNutrition {
  final String? mealName;
  final String name;
  final int calories;
  final int fat;
  final int carbs;
  final int protein;
  final String servingUnit;

  DailyNutrition({
    this.mealName,
    required this.name,
    required this.calories,
    required this.fat,
    required this.carbs,
    required this.protein,
    required this.servingUnit,
  });

  // @override
  // String toString() {
  //   return 'Name: $name, Calories: $calories kcal, Fat: $fat g, Carbs: $carbs g, Protein: $protein g, Serving Unit: $servingUnit'; // 출력 형식
  // }
}
