import 'package:diet_macro/models/isar_data.dart';
import 'package:diet_macro/models/isar_service.dart';
import 'package:diet_macro/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class SecondIntro extends StatefulWidget {
  const SecondIntro({super.key});

  @override
  State<SecondIntro> createState() => _SecondIntroState();
}

class _SecondIntroState extends State<SecondIntro> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        leading: IconButton(
          padding: const EdgeInsets.only(left: 12.0),
          icon: const Icon(Icons.arrow_back, color: Colors.black), // 뒤로가기 아이콘 색상 변경
          onPressed: () => Navigator.of(context).pop(), // 뒤로가기 기능
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            const Spacer(),
            Text(
              '식단의 탄단지 비율을 선택하세요',
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 70,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder<String>(
                    future: _getSelectedText(_selectedIndex),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator(); // 데이터 로딩 중 표시
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}'); // 에러 발생 시 메시지 표시
                      } else {
                        return Text(
                          snapshot.data ?? '', // 계산된 텍스트 표시
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          ),
                          textAlign: TextAlign.center,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildToggleButton(0, '6  :  2  :  2'),
                _buildToggleButton(1, '5  :  3  :  2'),
                _buildToggleButton(2, '4  :  4  :  2'),
              ],
            ),

            const Spacer(),

            // start now button
            ElevatedButton(
              onPressed: _selectedIndex != -1 // _selectedIndex가 -1이 아니면 활성화
                  ? () async {
                      TargetData? existingTargetData = await IsarService.isar.targetDatas.where().findFirst();
                      int calories = existingTargetData!.targetCalories;

                      switch (_selectedIndex) {
                        case 0:
                          existingTargetData.targetCarb = ((calories * 0.6 / 4)).toInt();
                          existingTargetData.targetProtein = ((calories * 0.2 / 4)).toInt();
                          existingTargetData.targetFat = ((calories * 0.2 / 9)).toInt();
                          break;
                        case 1:
                          existingTargetData.targetCarb = ((calories * 0.5) / 4).toInt();
                          existingTargetData.targetProtein = ((calories * 0.3) / 4).toInt();
                          existingTargetData.targetFat = ((calories * 0.2 / 9)).toInt();
                          break;
                        case 2:
                          existingTargetData.targetCarb = ((calories * 0.4) / 4).toInt();
                          existingTargetData.targetProtein = ((calories * 0.4 / 4)).toInt();
                          existingTargetData.targetFat = ((calories * 0.2 / 9)).toInt();
                          break;
                        default:
                          // 선택된 항목이 없을 경우 기본 설정 (필요에 따라 수정)
                          break;
                      }
                      // 설정된 목표 칼로리, 탄수화물, 단백질, 지방 비율을 데이터베이스에 저장
                      await IsarService.isar
                          .writeTxn(() async => await IsarService.isar.targetDatas.put(existingTargetData));

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ));
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[900], // 버튼 배경색
                padding: const EdgeInsets.all(25), // 버튼 패딩
                shape: RoundedRectangleBorder(
                  // 버튼 모양
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Start Now',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ), // 버튼 텍스트
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(int index, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedIndex = (_selectedIndex == index) ? -1 : index;
          });
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 26),
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: _selectedIndex == index ? Colors.green : Colors.grey[700], // 선택된 버튼 색상 변경
        ),
        child: Text(text),
      ),
    );
  }

  Future<String> _getSelectedText(int index) async {
    TargetData? existingTargetData = await IsarService.isar.targetDatas.where().findFirst();
    int calories = existingTargetData!.targetCalories;

    switch (index) {
      case 0:
        return '탄: ${((calories * 0.6) / 4).toInt()}g   단: ${((calories * 0.2) / 4).toInt()}g   지: ${((calories * 0.2) / 9).toInt()}g';
      case 1:
        return '탄: ${((calories * 0.5) / 4).toInt()}g   단: ${((calories * 0.3) / 4).toInt()}g   지: ${((calories * 0.2) / 9).toInt()}g';
      case 2:
        return '탄: ${((calories * 0.4) / 4).toInt()}g   단: ${((calories * 0.4) / 4).toInt()}g   지: ${((calories * 0.2) / 9).toInt()}g';
      default:
        return '';
    }
  }
}
