import '../../models/isar_data.dart';

abstract class TargetDataRepository {
  Future<TargetData?> getTargetData();
  Future<void> updateTargetData(TargetData targetData);
}
