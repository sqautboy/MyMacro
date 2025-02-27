import '../../../core/injection/get_it.dart';
import '../../datasource/local/isar_datasource.dart';
import '../../isar/isar_data.dart';
import 'meal_data_repository.dart';

class MealDataRepositoryImpl implements MealDataRepository {
  final IsarDatasource _isarDatasource = getIt<IsarDatasource>();
  // MealData 추가 메소드
  @override
  Future<void> addMealData(MealData mealData) {
    return _isarDatasource.addMealData(mealData); // MealData를 데이터소스에 추가
  }

  // MealData 조회 메소드
  @override
  Future<List<MealData>> getMealDataForToday() async {
    final now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toLocal();
    final existingData = await _isarDatasource.getMealsByDate(now); // 오늘 날짜의 MealData 가져오기

    // 데이터베이스에 기존 데이터가 있으면 기존 데이터를 반환
    if (existingData.isNotEmpty) return existingData;

    return [MealData()];
  }
}
