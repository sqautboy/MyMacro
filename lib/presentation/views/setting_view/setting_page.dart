import 'package:diet_macro/styles/nutrition_color_set.dart';
import 'package:diet_macro/presentation/widgets/setting_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Text(
            'Welcome to',
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              // color: Colors.grey[850],
            ),
          ).animate().fade(duration: const Duration(milliseconds: 800)),
          Text(
            'MyMacro',
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 42,
              fontWeight: FontWeight.w700,
              // color: Colors.grey[850],
            ),
          ).animate().fade(duration: const Duration(milliseconds: 800)),
          const SizedBox(height: 12),
          Divider(
            color: Colors.grey[500],
            indent: 42,
            endIndent: 42,
          ),
          const Spacer(),
          const SettingCard(
            title: 'Reset',
            subtitle: 'Reset your calories goal',
            iconDir: 'assets/images/reset.png',
          ).animate().fade(duration: const Duration(milliseconds: 500)),
          const SizedBox(height: 20),
          const SettingCard(
            title: 'Delete',
            subtitle: 'Delete all of daily data',
            iconDir: 'assets/images/delete.png',
          ).animate().fade(),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
