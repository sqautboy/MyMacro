import 'package:diet_macro/presentation/views/calendar/date_page.dart';
import 'package:diet_macro/presentation/views/diet_page/diet_page.dart';
import 'package:diet_macro/presentation/views/food_search/food_search_page.dart';
import 'package:diet_macro/presentation/views/setting_view/setting_page.dart';
import 'package:diet_macro/styles/nutrition_color_set.dart';
import 'package:diet_macro/presentation/widgets/bottom_navigation_bar.dart';
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
    const FoodSearchPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: navigationBottomBar,
        currentIndex: _selectedIndex,
      ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: mainColor,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Image(image: AssetImage('assets/images/cat.png')),
            ),
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: const MyDrawer(),
      body: _pages[_selectedIndex], // 이 부분만 변경됨
    );
  }
}
