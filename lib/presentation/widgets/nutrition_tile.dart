import 'package:flutter/material.dart';

import '../../core/styles/typography.dart';

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
                style: MyTypos.caption1,
              ),
              Text(
                status,
                style: MyTypos.caption3,
              ),
            ],
          ),
          const Spacer(),
          Text(
            '$percentage%',
            style: MyTypos.body2Regular,
          ),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}
