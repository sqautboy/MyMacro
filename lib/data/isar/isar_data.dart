// data/models/isar_data.dart

import 'package:isar/isar.dart';

part 'isar_data.g.dart';

@collection
class TargetData {
  Id id = 1;

  int targetCalories = 0;
  int targetCarb = 0;
  int targetProtein = 0;
  int targetFat = 0;
}

@collection
class DailyData {
  Id id = Isar.autoIncrement; // autoIncrement 사용

  DateTime date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toLocal();
  int calories = 0;
  int carb = 0;
  int protein = 0;
  int fat = 0;
}

// MealData 모델 추가
@collection
class MealData {
  Id id = Isar.autoIncrement;

  DateTime date = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toLocal();
  int calories = 0;
  int carb = 0;
  int protein = 0;
  int fat = 0;
}
