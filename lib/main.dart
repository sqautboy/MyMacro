import 'package:diet_macro/models/isar_data.dart';
import 'package:diet_macro/models/isar_service.dart';
import 'package:diet_macro/pages/first_intro.dart';
import 'package:diet_macro/pages/main_page.dart';

import 'package:flutter/material.dart';

void main() async {
  // 앱 초기화 시 IsarService 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.initialize();

  final targetCalories = await IsarService().getTargetData();

  runApp(MyApp(targetCalories: targetCalories)); // targetCalories 전달
}

class MyApp extends StatelessWidget {
  final TargetData? targetCalories; // targetCalories 받기

  const MyApp({super.key, required this.targetCalories});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: targetCalories == null ? const FirstIntro() : const MainPage(), // 조건에 따라 페이지 설정
    );
  }
}
