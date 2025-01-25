import 'package:diet_macro/data/datasources/local/isar_datasource.dart';
import 'package:diet_macro/data/repositories/daily_data/daily_data_repository_impl.dart';
import 'package:diet_macro/data/repositories/food_search/food_repository.dart';
import 'package:diet_macro/data/repositories/food_search/food_repository_impl.dart';

import 'package:diet_macro/data/repositories/target_data/target_data_repository.dart';
import 'package:diet_macro/data/repositories/target_data/target_data_repository_impl.dart';

import 'package:diet_macro/presentation/views/diet_view/diet_view_model.dart';
import 'package:diet_macro/presentation/views/food_search/food_search_viewmodel.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/remote/food_search_api.dart';
import '../../data/repositories/daily_data/daily_data_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // DataSource
  getIt.registerLazySingleton<FoodSearchApi>(() => FoodSearchApi());
  getIt.registerLazySingleton<IsarDatasource>(() => IsarDatasource());

  // Repository
  getIt.registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl(getIt<FoodSearchApi>()));
  getIt.registerLazySingleton<DailyDataRepository>(() => DailyDataRepositoryImpl());
  getIt.registerLazySingleton<TargetDataRepository>(() => TargetDataRepositoryImpl());

  // ViewModel
  getIt.registerFactory<FoodSearchViewModel>(() => FoodSearchViewModel());
  getIt.registerFactory<DietViewModel>(() => DietViewModel());
}
