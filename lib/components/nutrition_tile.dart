import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NutritionTile extends StatelessWidget {
  final Color dividerColor;
  final String nutrition;
  final String status;
  final int percentage;

  const NutritionTile({
    super.key,
    required this.dividerColor,
    required this.nutrition,
    required this.status,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
              ),
              color: dividerColor,
            ),
            width: 14,
            height: 50,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nutrition,
                style: GoogleFonts.roboto(
                  color: Color.fromARGB(255, 61, 61, 61),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Text(
                status,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: const Color.fromARGB(255, 87, 87, 87),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '$percentage%',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w300,
              fontSize: 18,
              color: const Color.fromARGB(255, 36, 36, 36),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}
