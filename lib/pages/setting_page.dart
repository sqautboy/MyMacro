import 'package:diet_macro/components/setting_card.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SettingCard(
            title: 'RESET',
            subtitle: 'Click to reset your calories goal',
            iconDir: 'lib/images/reset_icon.json',
          ),
          const SizedBox(height: 20),
          SettingCard(
            title: '- - - - - -',
            subtitle: '더워 피곤해 졸려 힘들어',
            iconDir: 'lib/images/thinking.json',
          )
        ],
      ),
    );
  }
}
