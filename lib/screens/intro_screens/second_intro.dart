import 'package:diet_macro/models/isar_data.dart';
import 'package:diet_macro/services/isar.service.dart';
import 'package:diet_macro/page_router.dart';
import 'package:diet_macro/screens/intro_screens/manual_page.dart';
import 'package:diet_macro/utils/color_set.dart';
import 'package:diet_macro/utils/google_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: mainColor,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 12.0),
          icon: const Icon(Icons.arrow_back, color: Colors.black), // 뒤로가기 아이콘 색상 변경
          onPressed: () => Navigator.of(context).pop(), // 뒤로가기 기능
        ),
      ),
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Select Your Diet Option',
              style: GoogleTextStyles.dmSerifDisplayLarge(
                fontWeight: FontWeight.w700,
                color: Colors.grey[850],
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
                        // 계산된 텍스트 표시
                        return Text(
                          snapshot.data ?? '',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
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
                const SizedBox(height: 36),
                _buildToggleButton(1, '5  :  3  :  2'),
                const SizedBox(height: 36),
                _buildToggleButton(2, '4  :  4  :  2'),
              ],
            ),

            const Spacer(),

            // Start Now Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ElevatedButton(
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
                            // 선택된 항목이 없을 경우 기본 설정
                            break;
                        }
                        // 설정된 목표 칼로리, 탄수화물, 단백질, 지방 비율을 데이터베이스에 저장
                        await IsarService.isar
                            .writeTxn(() async => await IsarService.isar.targetDatas.put(existingTargetData));

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PageRouter(),
                            ));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[900], // 버튼 배경색
                  padding: const EdgeInsets.all(25), // 버튼 패딩
                  shape: RoundedRectangleBorder(
                    // 버튼 모양
                    borderRadius: BorderRadius.circular(48),
                  ),
                  // minimumSize: const Size(double.infinity, 50),
                ),
                child: const Center(
                  child: Text(
                    'Start Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ), // 버튼 텍스트
              ),
            ),

            const SizedBox(height: 24),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ManualPage(),
                    ));
              },
              child: RichText(
                text: TextSpan(
                  text: 'click ',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'here', style: TextStyle(color: Colors.blue[600])),
                    TextSpan(text: ' to set manually', style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
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
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedIndex = (_selectedIndex == index) ? -1 : index;
        });
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        backgroundColor: _selectedIndex == index ? Colors.green : Colors.grey[700], // 선택된 버튼 색상 변경
      ),
      child: Text(text),
    );
  }

  Future<String> _getSelectedText(int index) async {
    TargetData? existingTargetData = await IsarService.isar.targetDatas.where().findFirst();
    int calories = existingTargetData!.targetCalories;

    switch (index) {
      case 0:
        return 'Carb: ${((calories * 0.6) / 4).toInt()}g   Prot: ${((calories * 0.2) / 4).toInt()}g   Fat: ${((calories * 0.2) / 9).toInt()}g';
      case 1:
        return 'Carb: ${((calories * 0.5) / 4).toInt()}g   Prot: ${((calories * 0.3) / 4).toInt()}g   Fat: ${((calories * 0.2) / 9).toInt()}g';
      case 2:
        return 'Carb: ${((calories * 0.4) / 4).toInt()}g   Prot: ${((calories * 0.4) / 4).toInt()}g   Fat: ${((calories * 0.2) / 9).toInt()}g';
      default:
        return '';
    }
  }
}
