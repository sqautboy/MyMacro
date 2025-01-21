import 'package:diet_macro/data/datasources/local/isar_datasource.dart';
import 'package:diet_macro/data/models/isar_data.dart';
import 'package:diet_macro/data/repositories/daily_data/i_daily_data_repository.dart';

class DailyDataRepositoryImpl implements IDailyDataRepository {
  final IsarDatasource _isarDatasource;

  DailyDataRepositoryImpl(this._isarDatasource);

  @override
  Future<DailyData> getDailyDataForToday() async {
    final now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final existingData = await _isarDatasource.getDailyDataByDate(now);

    if (existingData != null) {
      // 데이터베이스에 기존 데이터가 있으면 기존 데이터를 반환
      return existingData;
    }

    // 데이터베이스에 기존 데이터가 없으면 새로운 DailyData 객체를 생성
    return DailyData();
  }

  @override
  Future<void> updateDailyData(DailyData dailyData) async {
    await _isarDatasource.updateDailyData(dailyData);
  }
}
