import 'package:diet_macro/data/models/isar_data.dart';
import 'package:diet_macro/data/services/isar_service.dart';
import 'package:diet_macro/page_router.dart';
import 'package:diet_macro/styles/typography.dart';
import 'package:diet_macro/styles/nutrition_color_set.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class ManualPage extends StatelessWidget {
  const ManualPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carbController = TextEditingController();
    final proteinController = TextEditingController();
    final fatController = TextEditingController();

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Enter Your Diet Option',
            style: MyTypos.heading3ExtraBold,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          const Text(
            'Carb',
            style: MyTypos.heading4ExtraBold,
          ),
          _buildInputField('Enter Carb (g)', carbController),
          const SizedBox(height: 52),
          const Text(
            'Protein',
            style: MyTypos.heading4ExtraBold,
          ),
          _buildInputField('Enter Protein (g)', proteinController),
          const SizedBox(height: 52),
          const Text(
            'Fat',
            style: MyTypos.heading4ExtraBold,
          ),
          _buildInputField('Enter Fat (g)', fatController),
          const SizedBox(height: 52),
          const Text(
            'Set your macros according to your target calories!',
            style: MyTypos.caption3,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ElevatedButton(
              onPressed: () async {
                // targetData 가져오기
                final targetData = await IsarService.isar.targetDatas.where().findFirst();

                // textfield 에서 값을 읽어와 정수형으로 변환
                targetData!
                  ..targetCarb = int.tryParse(carbController.text) ?? 0
                  ..targetProtein = int.tryParse(proteinController.text) ?? 0
                  ..targetFat = int.tryParse(fatController.text) ?? 0;

                await IsarService().updateTargetData(targetData);

                // MainPage 이동
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PageRouter(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[900],
                padding: const EdgeInsets.all(25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
              ),
              child: const Center(
                child: Text(
                  'Next',
                  style: MyTypos.button,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 100, right: 100),
      child: TextField(
        cursorColor: Colors.black,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: MyTypos.caption3,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(32.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
