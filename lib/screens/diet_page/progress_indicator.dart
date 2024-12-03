import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyProgressIndicator extends StatelessWidget {
  final double percent;
  final Color progressColor;
  final String centerText1;
  final String centerText2;

  const MyProgressIndicator({
    Key? key,
    required this.percent,
    required this.progressColor,
    required this.centerText1,
    required this.centerText2,
  }) : super(key: key);

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
            style: GoogleFonts.dmSerifDisplay(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Text(
            centerText2,
            style: GoogleFonts.roboto(
              color: Colors.grey[800],
              fontSize: 12,
            ),
          ),
        ],
      ),
      progressColor: progressColor,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
