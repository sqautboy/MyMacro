import '../../isar/isar_data.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource {
  static late Isar isar;

  // I N I T I A L I Z E  D A T A B A S E
  static Future<void> initialize() async {
    final dir = await getApplicationSupportDirectory();
    isar = await Isar.open(
      [TargetDataSchema, DailyDataSchema, MealDataSchema],
      directory: dir.path,
    );
  }

  // Future<void> createDailyData(DateTime date, int calories, int carb, int protein, int fat) async {
  //   final newDailyData = DailyData()
  //     ..date = date
  //     ..calories = calories
  //     ..carb = carb
  //     ..protein = protein
  //     ..fat = fat;

  //   await isar.writeTxn(() async {
  //     await isar.dailyDatas.put(newDailyData);
  //   });
  // }

  // // TargetData 생성 (기존 TargetData가 없는 경우)
  // Future<void> createTargetData(int targetCalories, int targetCarb, int targetProtein, int targetFat) async {
  //   final existingTargetData = await getTargetData();

  //   if (existingTargetData == null) {
  //     final newTargetData = TargetData()
  //       ..targetCalories = targetCalories
  //       ..targetCarb = targetCarb
  //       ..targetProtein = targetProtein
  //       ..targetFat = targetFat;

  //     updateTargetData(newTargetData);

  //     // await isar.writeTxn(() async {
  //     //   await isar.targetDatas.put(newTargetData);
  //     // });
  //   }
  // }

  // MealData 관련 메소드 추가
  Future<List<MealData>> getMealsByDate(DateTime date) async {
    return await isar.mealDatas.filter().dateEqualTo(date).findAll();
  }

  Future<void> addMealData(MealData mealData) async {
    await isar.writeTxn(() async {
      await isar.mealDatas.put(mealData);
    });
  }

  // R E A D
  // 모든 DailyData 조회

  // 특정 날짜의 DailyData 조회
  Future<DailyData?> getDailyDataByDate(DateTime date) async {
    return await isar.dailyDatas.filter().dateEqualTo(date).findFirst();
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
