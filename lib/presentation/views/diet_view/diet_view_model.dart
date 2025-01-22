import 'package:diet_macro/core/injection/get_it.dart';
import 'package:diet_macro/data/models/isar_data.dart';
import 'package:diet_macro/data/repositories/daily_data/i_daily_data_repository.dart';
import 'package:diet_macro/data/repositories/target_data/i_target_data_repository.dart';
import 'package:flutter/material.dart';

class DietViewModel with ChangeNotifier {
  final ITargetDataRepository _targetDataRepository = getIt<ITargetDataRepository>();
  final IDailyDataRepository _dailyDataRepository = getIt<IDailyDataRepository>();

  TargetData _targetData = TargetData();
  DailyData _dailyData = DailyData();

  TargetData get targetData => _targetData;
  DailyData get dailyData => _dailyData;

  // get_it DI 로 인해 라인 삭제
  // DietViewModel(this._targetDataRepository, this._dailyDataRepository);

  double get caloriesPercent => _calculatePercent(dailyData.calories, targetData.targetCalories);
  double get carbPercent => _calculatePercent(dailyData.carb, targetData.targetCarb);
  double get proteinPercent => _calculatePercent(dailyData.protein, targetData.targetProtein);
  double get fatPercent => _calculatePercent(dailyData.fat, targetData.targetFat);

  Future<void> loadData() async {
    _targetData = await _targetDataRepository.getTargetData() ?? TargetData();
    _dailyData = await _dailyDataRepository.getDailyDataForToday();

    // D E B U G
    print('============= ISAR DATA LOADED =============');
    print(
        "TargetData: ${_targetData.targetCalories}칼로리, ${_targetData.targetCarb}탄수화물, ${_targetData.targetProtein}단백질, ${_targetData.targetFat}지방");
    print("DailyData: ${dailyData.calories}칼로리, ${dailyData.carb}탄수화물, ${dailyData.protein}단백질, ${dailyData.fat}지방");
    print('============================================');

    notifyListeners();
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
    _dailyData
      ..calories += calories
      ..carb += carb
      ..protein += protein
      ..fat += fat;
    _dailyDataRepository.updateDailyData(_dailyData);

    notifyListeners();
  }
}
