import '../../isar/isar_data.dart';

abstract interface class MealDataRepository {
  Future<void> addMealData(MealData mealData);
  Future<List<MealData>?> getMealDataForToday();
}
