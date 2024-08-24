import 'package:diet_macro/models/isar_data.dart';
import 'package:diet_macro/models/isar_service.dart';
import 'package:flutter/material.dart';

class DietProvider with ChangeNotifier {
  TargetData targetData = TargetData(); // Initialize with default values
  DailyData dailyData = DailyData(); // Initialize with default values
  bool loading = true; // Add a loading state

  double get caloriesPercent => _calculatePercent(dailyData.calories, targetData.targetCalories);
  double get carbPercent => _calculatePercent(dailyData.carb, targetData.targetCarb);
  double get proteinPercent => _calculatePercent(dailyData.protein, targetData.targetProtein);
  double get fatPercent => _calculatePercent(dailyData.fat, targetData.targetFat);

  // Isar 데이터 로드
  Future<void> loadData() async {
    targetData = await IsarService().getTargetData() ?? TargetData();
    dailyData = await _getDailyDataForToday();

    // D E B U G
    print("DailyData: ${dailyData.calories}칼로리, ${dailyData.carb}탄수화물, ${dailyData.protein}단백질, ${dailyData.fat}지방");

    // 데이터 로드 후 UI 업데이트
    loading = false;
    notifyListeners();
  }

  // 오늘 날짜의 DailyData 가져오기
  // Future<DailyData> _getDailyDataForToday() async {
  //   final now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  //   final existingData = await IsarService().getDailyDataByDate(now);

  //   if (existingData != null) {
  //     // 기존 데이터가 있을 경우, 기존 데이터에 더하기
  //     existingData.calories += dailyData.calories;
  //     existingData.carb += dailyData.carb;
  //     existingData.protein += dailyData.protein;
  //     existingData.fat += dailyData.fat;

  //     // 업데이트된 데이터를 저장
  //     await IsarService().updateDailyData(existingData);
  //     return existingData;
  //   }

  //   return DailyData(); // 기존 데이터가 없으면 새로운 DailyData 반환
  // }

  Future<DailyData> _getDailyDataForToday() async {
    final now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final existingData = await IsarService().getDailyDataByDate(now);

    if (existingData != null) {
      // 데이터베이스에 기존 데이터가 있으면 기존 데이터를 반환
      return existingData;
    }

    // 데이터베이스에 기존 데이터가 없으면 새로운 DailyData 객체를 생성
    return DailyData();
  }

  // 진행률 계산 함수
  double _calculatePercent(int current, int target) {
    if (current >= target) {
      return 1;
    } else {
      return 1 - (target - current) / target;
    }
  }

  // DailyData 업데이트
  void updateDailyData(int calories, int carb, int protein, int fat) {
    dailyData
      ..calories += calories
      ..carb += carb
      ..protein += protein
      ..fat += fat;
    IsarService().updateDailyData(dailyData);
    notifyListeners();
  }
}
