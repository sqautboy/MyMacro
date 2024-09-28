import 'package:diet_macro/models/isar_data.dart';
import 'package:diet_macro/services/isar.service.dart';
import 'package:diet_macro/pages/second_intro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Lottie.asset(
                  'lib/images/animated_icon.json',
                  width: 300,
                ),

                // title
                Text(
                  'MyMacro',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                // sub title
                Text(
                  'Enter your Calories Goal',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 48,
                ),

                // targetCalorie Input Field
                TextField(
                  onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                  controller: _targetCalorieController,
                  decoration: InputDecoration(
                    labelText: 'CALORIES GOAL',
                    hintText: 'Kcal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(48),
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
                  child: Center(
                    child: Text(
                      'Next',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
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
