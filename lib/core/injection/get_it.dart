import '../../data/repository/meal_data/meal_data_repository.dart';
import '../../data/repository/meal_data/meal_data_repository_impl.dart';

import '../../data/datasource/local/isar_datasource.dart';
import '../../data/repository/daily_data/daily_data_repository_impl.dart';
import '../../data/repository/food_search/food_repository.dart';
import '../../data/repository/food_search/food_repository_impl.dart';

import '../../data/repository/target_data/target_data_repository.dart';
import '../../data/repository/target_data/target_data_repository_impl.dart';

import '../../presentation/views/diet_view/diet_view_model.dart';
import '../../presentation/views/food_search/food_search_viewmodel.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasource/remote/food_search_api.dart';
import '../../data/repository/daily_data/daily_data_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // DataSource
  getIt.registerLazySingleton<FoodSearchApi>(() => FoodSearchApi());
  getIt.registerLazySingleton<IsarDatasource>(() => IsarDatasource());

  // Repository
  getIt.registerLazySingleton<FoodRepository>(() => FoodRepositoryImpl(getIt<FoodSearchApi>()));
  getIt.registerLazySingleton<DailyDataRepository>(() => DailyDataRepositoryImpl());
  getIt.registerLazySingleton<TargetDataRepository>(() => TargetDataRepositoryImpl());
  getIt.registerLazySingleton<MealDataRepository>(() => MealDataRepositoryImpl());

  // ViewModel
  getIt.registerFactory<FoodSearchViewModel>(() => FoodSearchViewModel());
  getIt.registerFactory<DietViewModel>(() => DietViewModel());
}
