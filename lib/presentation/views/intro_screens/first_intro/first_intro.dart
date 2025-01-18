import 'package:diet_macro/data/models/isar_data.dart';
import 'package:diet_macro/data/services/isar_service.dart';
import 'package:diet_macro/presentation/views/intro_screens/second_intro/second_intro.dart';
import 'package:diet_macro/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lottie/lottie.dart';

class FirstIntro extends StatefulWidget {
  const FirstIntro({super.key});

  @override
  State<FirstIntro> createState() => _FirstIntroState();
}

class _FirstIntroState extends State<FirstIntro> {
  // TextEditingController 추가
  final TextEditingController _targetCalorieController = TextEditingController();
  bool _isButtonEnabled = false; // 버튼 활성화 상태 변수 추가

  @override
  void dispose() {
    _targetCalorieController.dispose(); // 컨트롤러 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Lottie.asset(
                  'assets/images/animated_icon.json',
                  width: 300,
                ),

                // title
                const Text(
                  'MyMacro',
                  style: MyTypos.heading1ExtraBold,
                ),

                const SizedBox(
                  height: 20,
                ),

                // sub title
                const Text(
                  'Enter your Calories Goal',
                  style: MyTypos.body1Medium,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 48,
                ),

                // targetCalorie Input Field
                TextField(
                  onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                  controller: _targetCalorieController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Enter your calories goal (Kcal)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    labelStyle: const TextStyle(fontSize: 12),
                    hintStyle: const TextStyle(fontSize: 14),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    // 텍스트 필드 값이 변경될 때마다 버튼 활성화 상태 업데이트
                    setState(() {
                      _isButtonEnabled = text.isNotEmpty;
                    });
                  },
                ),

                const SizedBox(
                  height: 48,
                ),

                // start now button
                ElevatedButton(
                  // GestureDetector 대신 ElevatedButton 사용
                  onPressed: _isButtonEnabled // 버튼 활성화 상태에 따라 onPressed 설정
                      ? () async {
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
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isButtonEnabled ? Colors.grey[900] : Colors.grey, // 버튼 색상 변경
                    padding: const EdgeInsets.all(25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: MyTypos.body1Medium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
