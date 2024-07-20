import 'package:flutter/material.dart';

class CurrentMacro extends StatefulWidget {
  const CurrentMacro({super.key});

  @override
  State<CurrentMacro> createState() => _CurrentMacroState();
}

class _CurrentMacroState extends State<CurrentMacro> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Divider(
          color: Colors.green,
        ),
        Column(
          children: [
            Text('Calories'),
            Text('1200 / 2000'),
          ],
        )
      ],
    );
  }
}
