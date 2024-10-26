import 'package:diet_macro/models/isar_data.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  static late Isar isar;

  // I N I T I A L I Z E  D A T A B A S E
  static Future<void> initialize() async {
    final dir = await getApplicationSupportDirectory();
    isar = await Isar.open(
      [TargetDataSchema, DailyDataSchema],
      directory: dir.path,
    );
  }

  final List<DailyData> dailyDataList = [];

  // C R E A T E
  // DailyData 생성
  Future<void> createDailyData(DateTime date, int calories, int carb, int protein, int fat) async {
    final newDailyData = DailyData()
      ..date = date
      ..calories = calories
      ..carb = carb
      ..protein = protein
      ..fat = fat;

    await isar.writeTxn(() async {
      await isar.dailyDatas.put(newDailyData);
    });
  }

  // TargetData 생성 (기존 TargetData가 없는 경우)
  Future<void> createTargetData(int targetCalories, int targetCarb, int targetProtein, int targetFat) async {
    final existingTargetData = await getTargetData();

    if (existingTargetData == null) {
      final newTargetData = TargetData()
        ..targetCalories = targetCalories
        ..targetCarb = targetCarb
        ..targetProtein = targetProtein
        ..targetFat = targetFat;

      updateTargetData(newTargetData);

      // await isar.writeTxn(() async {
      //   await isar.targetDatas.put(newTargetData);
      // });
    }
  }

  // R E A D
  // 모든 DailyData 조회
  Future<List<DailyData>> getAllDailyData() async {
    return await isar.dailyDatas.where().findAll();
  }

  // 특정 날짜의 DailyData 조회
  Future<DailyData?> getDailyDataByDate(DateTime date) async {
    return await isar.dailyDatas.filter().dateEqualTo(date, date.month).findFirst();
  }

  // TargetData 조회
  Future<TargetData?> getTargetData() async {
    return await isar.targetDatas.where().findFirst();
  }

  // U P D A T E
  // DailyData 업데이트
  Future<void> updateDailyData(DailyData dailyData) async {
    await isar.writeTxn(() async {
      await isar.dailyDatas.put(dailyData);
    });
  }

  // TargetData 업데이트
  Future<void> updateTargetData(TargetData targetData) async {
    await isar.writeTxn(() async {
      await isar.targetDatas.put(targetData);
    });
  }

  // D E L E T E
  // DailyData 삭제
  Future<void> deleteDailyData(int id) async {
    await isar.writeTxn(() async {
      await isar.dailyDatas.delete(id);
    });
  }

  // 모든 DailyData 삭제
  Future<void> deleteAllDailyData() async {
    await isar.writeTxn(() async {
      await isar.dailyDatas.where().deleteAll();
    });
  }

  // TargetData 삭제
  Future<void> deleteTargetData(int id) async {
    await isar.writeTxn(() async {
      await isar.targetDatas.delete(id);
    });
  }
}
