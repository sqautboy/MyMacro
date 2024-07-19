import 'package:diet_macro/components/calendar.dart';
import 'package:flutter/material.dart';

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const Column(
        children: [
          MyCalendar(),
        ],
      ),
    );
  }
}
