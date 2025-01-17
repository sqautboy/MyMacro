import 'package:diet_macro/providers/diet_provider.dart';
import 'package:diet_macro/providers/food_provider.dart';
import 'package:diet_macro/data/models/isar_data.dart';
import 'package:diet_macro/data/services/isar_service.dart';
import 'package:diet_macro/presentation/views/intro_screens/first_intro/first_intro.dart';
import 'package:diet_macro/page_router.dart';
import 'package:diet_macro/data/services/noti_service.dart';
import 'package:diet_macro/core/styles/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  // 앱 초기화 시 IsarService 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  await IsarService.initialize();
  await dotenv.load(fileName: '.env');

  final targetCalories = await IsarService().getTargetData();

  // local noti test
  Future.delayed(const Duration(seconds: 3), () {
    // print('알람 테스트');
    // NotificationService().showTestNotification("title", "body test");
    NotificationService().scheduleDailyNotification();
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => DietProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => FoodProvider()),
      ],
      child: MyApp(targetCalories: targetCalories),
    ),
  ); // targetCalories 전달
}

class MyApp extends StatelessWidget {
  final TargetData? targetCalories; // targetCalories 받기

  const MyApp({super.key, required this.targetCalories});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myLightTheme,
      debugShowCheckedModeBanner: false,
      home: targetCalories == null ? const FirstIntro() : const PageRouter(), // 조건에 따라 페이지 설정
    );
  }
}
