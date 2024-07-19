import 'package:diet_macro/models/isar_service.dart';
import 'package:diet_macro/pages/first_intro.dart';

import 'package:flutter/material.dart';

void main() async {
  // 앱 초기화 시 IsarService 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstIntro(),
    );
  }
}
