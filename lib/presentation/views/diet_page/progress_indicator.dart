import 'package:diet_macro/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyProgressIndicator extends StatelessWidget {
  final double percent;
  final Color progressColor;
  final String centerText1;
  final String centerText2;

  const MyProgressIndicator({
    super.key,
    required this.percent,
    required this.progressColor,
    required this.centerText1,
    required this.centerText2,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 52.0,
      lineWidth: 13,
      animation: true,
      animationDuration: 1000,
      backgroundColor: const Color.fromARGB(100, 255, 255, 255),
      percent: percent,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            centerText1,
            style: MyTypos.body2SemiBold,
          ),
          Text(
            centerText2,
            style: MyTypos.caption2,
          ),
        ],
      ),
      progressColor: progressColor,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
