import 'package:diet_macro/components/setting_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('SETTINGS',
              style: GoogleFonts.robotoCondensed(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              )),
          Spacer(),
          SettingCard(
            title: 'RESET',
            subtitle: 'Click to reset your calories goal',
            iconDir: 'lib/images/brocoli.json',
          ),
          const SizedBox(height: 20),
          SettingCard(
            title: 'DELETE',
            subtitle: 'Click to delete your     daily data',
            iconDir: 'lib/images/orange.json',
          ),
          Spacer(),
        ],
      ),
    );
  }
}
