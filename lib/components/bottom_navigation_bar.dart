import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key, required this.onTabChange});
  final void Function(int)? onTabChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        activeColor: Colors.grey.shade700,
        tabBackgroundColor: Colors.grey.shade200,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 24,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            gap: 5,
            icon: Icons.calculate,
            text: 'Diet',
          ),
          GButton(
            gap: 5,
            icon: Icons.calendar_month,
            text: 'Date',
          ),
          GButton(
            gap: 5,
            icon: Icons.settings,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
