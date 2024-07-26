import 'package:flutter/material.dart';

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
                style: const TextStyle(
                  color: Color.fromARGB(255, 46, 46, 46),
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Text(
                status,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(255, 87, 87, 87),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '$percentage%',
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
              color: Color.fromARGB(255, 36, 36, 36),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }
}
