import 'package:diet_macro/data/models/isar_data.dart';

abstract class ITargetDataRepository {
  Future<TargetData?> getTargetData();
  Future<void> updateTargetData(TargetData targetData);
}
