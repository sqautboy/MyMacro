import 'package:diet_macro/models/isar_data.dart';
import 'package:diet_macro/models/isar_service.dart';
import 'package:diet_macro/pages/second_intro.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class FirstIntro extends StatefulWidget {
  const FirstIntro({super.key});

  @override
  State<FirstIntro> createState() => _FirstIntroState();
}

class _FirstIntroState extends State<FirstIntro> {
  // TextEditingController 추가
  final TextEditingController _targetCalorieController = TextEditingController();

  @override
  void dispose() {
    _targetCalorieController.dispose(); // 컨트롤러 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              const Padding(
                padding: EdgeInsets.all(25.0),
                child: Icon(Icons.apple, size: 100),
              ),

              const SizedBox(
                height: 48,
              ),

              // title
              const Text(
                'Diet Macro',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(
                height: 48,
              ),

              // sub title
              const Text(
                '당신의 목표 칼로리를 입력하세요',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: 48,
              ),

              // targetCalorie Input Field
              TextField(
                controller: _targetCalorieController,
                decoration: const InputDecoration(
                  labelText: '목표 칼로리(Kcal)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),

              const SizedBox(
                height: 48,
              ),

              // start now button
              GestureDetector(
                onTap: () async {
                  // 1. TextField에서 입력된 값 가져오기
                  int targetCalories = int.tryParse(_targetCalorieController.text) ?? 0;

                  // 2. IsarService를 통해 TargetData 가져오기
                  TargetData? existingTargetData = await IsarService.isar.targetDatas.where().findFirst();

                  // 3. TargetData가 이미 존재하면 업데이트, 없으면 생성
                  if (existingTargetData != null) {
                    existingTargetData.targetCalories = targetCalories;
                    await IsarService.isar
                        .writeTxn(() async => await IsarService.isar.targetDatas.put(existingTargetData));
                  } else {
                    await IsarService.isar.writeTxn(() async {
                      await IsarService.isar.targetDatas.put(TargetData()..targetCalories = targetCalories);
                    });
                  }

                  print('입력된 텍스트: ${_targetCalorieController.text}');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondIntro(),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
