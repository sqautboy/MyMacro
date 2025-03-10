import '../../datasource/local/isar_datasource.dart';
import '../../isar/isar_data.dart';

import '../../../core/injection/get_it.dart';
import 'daily_data_repository.dart';

class DailyDataRepositoryImpl implements DailyDataRepository {
  final IsarDatasource _isarDatasource = getIt<IsarDatasource>();

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
