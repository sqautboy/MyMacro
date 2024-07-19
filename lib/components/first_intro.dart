import 'package:diet_macro/pages/second_intro.dart';
import 'package:flutter/material.dart';

class FirstIntro extends StatelessWidget {
  const FirstIntro({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController 추가
    final TextEditingController targetCalorieController = TextEditingController();

    return Center(
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
              '당신의 목표 칼로리를 입력하세요.',
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
              controller: targetCalorieController,
              decoration: InputDecoration(
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
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondIntro(),
                  )),
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
    );
  }
}
