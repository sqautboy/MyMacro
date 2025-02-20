import 'core/injection/get_it.dart';
import 'data/datasources/local/isar_datasource.dart';
import 'data/models/isar_data.dart';
import 'presentation/views/diet_view/diet_view_model.dart';
import 'presentation/views/food_search/food_search_viewmodel.dart';
import 'presentation/views/intro_screens/first_intro/first_intro.dart';
import 'page_router.dart';
import 'data/services/notification_service.dart';
import 'core/styles/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  // 앱 초기화 시 IsarService, dotenv 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  await IsarDatasource.initialize();
  await dotenv.load(fileName: '.env');

  setupDependencies(); // 의존성 주입 설정

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
        ChangeNotifierProvider(create: (_) => getIt<FoodSearchViewModel>()),
        ChangeNotifierProvider(create: (_) => getIt<DietViewModel>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: myLightTheme,
        debugShowCheckedModeBanner: false,
        home: targetCalories == null ? const FirstIntro() : const PageRouter(), // 조건에 따라 페이지 설정
      ),
    );
  }
}
