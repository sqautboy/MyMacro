import '../../../core/injection/get_it.dart';
import '../../datasource/local/isar_datasource.dart';
import '../../isar/isar_data.dart';
import 'target_data_repository.dart';

class TargetDataRepositoryImpl implements TargetDataRepository {
  final IsarDatasource _isarDatasource = getIt<IsarDatasource>();

  @override
  Future<TargetData?> getTargetData() async {
    return await _isarDatasource.getTargetData();
  }

  @override
  Future<void> updateTargetData(TargetData targetData) async {
    await _isarDatasource.updateTargetData(targetData);
  }
}
