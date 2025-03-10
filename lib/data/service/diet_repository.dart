import '../isar/isar_data.dart';

abstract class DietRepository {
  Future<TargetData?> getTargetData();
  Future<void> saveTargetData(TargetData targetData);
  Future<void> deleteTargetData();
}
