import 'package:diet_macro/pages/main_page.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // sub title
              Text(
                '식단의 탄단지 비율을 선택하세요',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: 60,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildToggleButton(0, 'Button 1'),
                  _buildToggleButton(1, 'Button 2'),
                  _buildToggleButton(2, 'Button 3'),
                ],
              ),

              const SizedBox(
                height: 80,
              ),

              // start now button
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    )),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      'Start Now',
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

  Widget _buildToggleButton(int index, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedIndex = (_selectedIndex == index) ? -1 : index;
          });
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 24),
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
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
}
