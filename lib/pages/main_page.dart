import 'package:diet_macro/components/bottom_navigation_bar.dart';
import 'package:diet_macro/components/drawer.dart';
import 'package:diet_macro/pages/date_page.dart';
import 'package:diet_macro/pages/diet_page.dart';
import 'package:diet_macro/pages/setting_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const DietPage(),
    const DatePage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: navigationBottomBar,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: const MyDrawer(),
      body: _pages[_selectedIndex],
    );
  }
}
