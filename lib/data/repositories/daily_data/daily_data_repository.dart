import '../../models/isar_data.dart';

abstract interface class DailyDataRepository {
  Future<DailyData> getDailyDataForToday();
  Future<void> updateDailyData(DailyData dailyData);
}
