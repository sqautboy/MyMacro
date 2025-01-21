import 'package:diet_macro/data/datasources/local/isar_datasource.dart';
import 'package:diet_macro/data/datasources/remote/food_search_api.dart';
import 'package:diet_macro/data/repositories/daily_data/daily_data_repository_impl.dart';
import 'package:diet_macro/data/repositories/food_search/food_repository_impl.dart';
import 'package:diet_macro/data/repositories/target_data/target_data_repository_impl.dart';
import 'package:diet_macro/presentation/views/diet_view/diet_view_model.dart';
import 'package:diet_macro/presentation/views/food_search/food_search_viewmodel.dart';
import 'package:diet_macro/data/models/isar_data.dart';
import 'package:diet_macro/presentation/views/intro_screens/first_intro/first_intro.dart';
import 'package:diet_macro/page_router.dart';
import 'package:diet_macro/data/services/notification_service.dart';
import 'package:diet_macro/styles/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  // 앱 초기화 시 IsarDatasource 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  await IsarDatasource.initialize();
  await dotenv.load(fileName: '.env');

  final targetCalories = await IsarDatasource().getTargetData();

  // local noti test
  Future.delayed(const Duration(seconds: 3), () {
    // print('알람 테스트');
    // NotificationService().showTestNotification("title", "body test");
    NotificationService().scheduleDailyNotification();
  });

  runApp(
    MyApp(targetCalories: targetCalories),
  ); // targetCalories 전달
}

class MyApp extends StatelessWidget {
  final TargetData? targetCalories; // targetCalories 받기

  const MyApp({super.key, required this.targetCalories});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) {
          final foodSearchApi = FoodSearchApi();
          final foodRepository = FoodRepositoryImpl(foodSearchApi);
          return FoodViewModel(foodRepository: foodRepository);
        }),
        ChangeNotifierProvider(create: (BuildContext context) {
          final isarDatasource = IsarDatasource();
          final targetDataRepository = TargetDataRepositoryImpl(isarDatasource);
          final dailyDataRepository = DailyDataRepositoryImpl(isarDatasource);
          return DietViewModel(targetDataRepository, dailyDataRepository);
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: myLightTheme,
        debugShowCheckedModeBanner: false,
        home: targetCalories == null ? const FirstIntro() : const PageRouter(), // 조건에 따라 페이지 설정
        // home: FirstIntro(),
      ),
    );
  }
}
