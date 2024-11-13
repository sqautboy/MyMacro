import 'package:diet_macro/screens/date_page.dart';
import 'package:diet_macro/screens/diet_page.dart';
import 'package:diet_macro/screens/food_list_page.dart';
import 'package:diet_macro/screens/setting_page.dart';
import 'package:diet_macro/utils/widgets/bottom_navigation_bar.dart';
import 'package:diet_macro/utils/drawer.dart';
import 'package:flutter/material.dart';

class PageRouter extends StatefulWidget {
  const PageRouter({super.key});

  @override
  State<PageRouter> createState() => _PageRouterState();
}

class _PageRouterState extends State<PageRouter> {
  int _selectedIndex = 0;

  void navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const DietPage(),
    const DatePage(),
    const FoodListPage(),
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
        scrolledUnderElevation: 0,
        backgroundColor: Colors.grey[300],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Image(image: AssetImage('lib/images/cat.png')),
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
