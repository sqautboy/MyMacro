// presentation/viewmodels/diet/diet_view_model.dart

import 'package:diet_macro/data/repository/meal_data/meal_data_repository.dart';

import '../../../core/injection/get_it.dart';
import '../../../data/isar/isar_data.dart';
import '../../../data/repository/daily_data/daily_data_repository.dart';
import '../../../data/repository/target_data/target_data_repository.dart';
import 'package:flutter/material.dart';

class DietViewModel with ChangeNotifier {
  final TargetDataRepository _targetDataRepository = getIt<TargetDataRepository>();
  final DailyDataRepository _dailyDataRepository = getIt<DailyDataRepository>();
  final MealDataRepository _mealDataRepository = getIt<MealDataRepository>();

  TargetData _targetData = TargetData();
  DailyData _dailyData = DailyData();
  List<MealData>? _mealData = []; // MealData 리스트로 변경

  TargetData get targetData => _targetData;
  DailyData get dailyData => _dailyData;
  List<MealData>? get mealData => _mealData; // MealData getter 를 List<MealData> 로 변경

  double get caloriesPercent => _calculatePercent(dailyData.calories, targetData.targetCalories);
  double get carbPercent => _calculatePercent(dailyData.carb, targetData.targetCarb);
  double get proteinPercent => _calculatePercent(dailyData.protein, targetData.targetProtein);
  double get fatPercent => _calculatePercent(dailyData.fat, targetData.targetFat);

  Future<void> loadData() async {
    _targetData = await _targetDataRepository.getTargetData() ?? TargetData();
    _dailyData = await _dailyDataRepository.getDailyDataForToday();
    _mealData = await _mealDataRepository.getMealDataForToday(); // MealData 리스트로 로드

    // D E B U G
    debugPrint('============= ISAR DATA LOADED =============');
    debugPrint(
        "TargetData: ${_targetData.targetCalories}칼로리, ${_targetData.targetCarb}탄수화물, ${_targetData.targetProtein}단백질, ${_targetData.targetFat}지방");
    debugPrint(
        "DailyData: ${dailyData.calories}칼로리, ${dailyData.carb}탄수화물, ${dailyData.protein}단백질, ${dailyData.fat}지방");
    debugPrint("Meals: ${_mealData?.length} meals loaded"); // MealData 리스트 로그 출력
    debugPrint('============================================');

    notifyListeners();
  }

  // 진행률 계산 함수 (기존 코드와 동일)
  double _calculatePercent(int current, int target) {
    if (current >= target) {
      return 1;
    } else {
      return 1 - (target - current) / target;
    }
  }

  // DailyData 업데이트 (기존 코드와 동일)
  Future<void> updateDailyData(int calories, int carb, int protein, int fat) async {
    _dailyData
      ..calories += calories
      ..carb += carb
      ..protein += protein
      ..fat += fat;

    await _dailyDataRepository.updateDailyData(_dailyData);

    notifyListeners();
  }

  // MealData 추가 (수정됨)
  Future<void> addMeal(int calories, int carb, int protein, int fat) async {
    final newMealData = MealData() // 새로운 MealData 객체 생성
      ..calories = calories
      ..carb = carb
      ..protein = protein
      ..fat = fat;

    await _mealDataRepository.addMealData(newMealData); // 새로운 MealData 객체 저장
    _mealData = await _mealDataRepository.getMealDataForToday(); // MealData 리스트 다시 로드 (UI 업데이트)

    notifyListeners();
  }
}
