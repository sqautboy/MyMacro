// 음식 정보 데이터 모델
class FoodNutrition {
  final String name;
  final int calories;
  final int fat;
  final int carbs;
  final int protein;
  final String servingUnit;

  FoodNutrition({
    required this.name,
    required this.calories,
    required this.fat,
    required this.carbs,
    required this.protein,
    required this.servingUnit,
  });

  @override
  String toString() {
    return 'Name: $name, Calories: $calories kcal, Fat: $fat g, Carbs: $carbs g, Protein: $protein g, Serving Unit: $servingUnit'; // 출력 형식
  }
}

// JSON 데이터에서 Food 객체 생성
//   factory Food.fromJson(Map<String, dynamic> json) {
//     final description = json['food_description'] as String;

//     return Food(
//       calories: _extractValue(description, 'Calories'),
//       fat: _extractValue(description, 'Fat'),
//       carbs: _extractValue(description, 'Carbs'),
//       protein: _extractValue(description, 'Protein'),
//     );
//   }

//   // 문자열에서 해당 영양소 값 추출하는 함수
//   static int _extractValue(String description, String nutrient) {
//     final regex = RegExp(r'$nutrient:\s*(\d+(?:\.\d+)?)');
//     final match = regex.firstMatch(description);
//     return int.tryParse(match?.group(1) ?? '0') ?? 0;
//   }
// }
