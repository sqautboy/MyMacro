import 'package:diet_macro/data/models/isar_data.dart';

abstract class IDailyDataRepository {
  Future<DailyData> getDailyDataForToday();
  Future<void> updateDailyData(DailyData dailyData);
}
