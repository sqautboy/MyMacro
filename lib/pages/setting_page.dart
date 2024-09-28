import 'package:diet_macro/components/setting_card.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SizedBox(height: 20),
          SettingCard(
            title: 'NUTRITION',
            subtitle: 'Check out food nutritions',
            iconDir: 'lib/images/search_nut.json',
          ),
          SizedBox(height: 20),
          SettingCard(
            title: 'RESET',
            subtitle: 'Reset your calories goal',
            iconDir: 'lib/images/reset.json',
          ),
          SizedBox(height: 20),
          SettingCard(
            title: 'DELETE',
            subtitle: 'Delete all of daily data',
            iconDir: 'lib/images/delete.json',
          ),
          Spacer(),
        ],
      ),
    );
  }
}
