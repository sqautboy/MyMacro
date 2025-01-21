import 'package:diet_macro/data/datasources/local/isar_datasource.dart';
import 'package:diet_macro/data/models/isar_data.dart';
import 'package:diet_macro/data/repositories/target_data/i_target_data_repository.dart';

class TargetDataRepositoryImpl implements ITargetDataRepository {
  final IsarDatasource _isarDatasource;

  TargetDataRepositoryImpl(this._isarDatasource);

  @override
  Future<TargetData?> getTargetData() async {
    return await _isarDatasource.getTargetData();
  }

  @override
  Future<void> updateTargetData(TargetData targetData) async {
    await _isarDatasource.updateTargetData(targetData);
  }
}
