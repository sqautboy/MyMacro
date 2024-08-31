// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class BottomModalSheet extends StatefulWidget {
  final Function(int, int, int, int) onAddPressed;

  const BottomModalSheet({super.key, required this.onAddPressed});

  @override
  State<BottomModalSheet> createState() => _BottomModalSheetState();
}

class _BottomModalSheetState extends State<BottomModalSheet> {
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController carbController = TextEditingController();
  final TextEditingController proteinController = TextEditingController();
  final TextEditingController fatController = TextEditingController();

  @override
  void dispose() {
    caloriesController.dispose();
    carbController.dispose();
    proteinController.dispose();
    fatController.dispose();
    super.dispose();
  }

  void _addButtonPressed() {
    final String calories = caloriesController.text;
    final String carb = carbController.text;
    final String protein = proteinController.text;
    final String fat = fatController.text;

    // 콜백 함수 호출하여 값 전달
    widget.onAddPressed(
      int.tryParse(calories) ?? 0, // null이면 0으로 변환
      int.tryParse(carb) ?? 0,
      int.tryParse(protein) ?? 0,
      int.tryParse(fat) ?? 0,
    );

    Navigator.pop(context); // 모덜 닫기

    // success animation modal popup dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });
        return AlertDialog(
          backgroundColor: Colors.transparent,
          title: Lottie.asset('lib/images/success.json'),
        );
      },
    );

    print('Calories: $calories');
    print('Carb: $carb');
    print('Protein: $protein');
    print('Fat: $fat');
    print("날짜: ${DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add Diet Info',
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Spacer(),
          _buildInputField('Calories', 'Kcal', caloriesController),
          _buildInputField('Carb', 'g', carbController),
          _buildInputField('Protein', 'g', proteinController),
          _buildInputField('Fat', 'g', fatController),
          const Spacer(),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                fixedSize: const Size(350, 50),
                foregroundColor: Colors.grey[300],
                backgroundColor: Colors.black,
              ),
              onPressed: _addButtonPressed,
              child: Text(
                'Add',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelStyle: GoogleFonts.roboto(fontSize: 14),
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
