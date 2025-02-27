import '../diet_view_model.dart';
import 'package:flutter/material.dart';
import 'bottom_modal_sheet.dart';

class MyFloatingActionButton extends StatelessWidget {
  final DietViewModel dietViewModel;

  const MyFloatingActionButton({
    super.key,
    required this.dietViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add Nutrition',
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: const Icon(Icons.add, color: Colors.white),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return BottomModalSheet(
              onAddPressed: (calories, carb, protein, fat) async {
                // DailyData 업데이트, MealData 추가
                await dietViewModel.addMeal(calories, carb, protein, fat);
                await dietViewModel.updateDailyData(calories, carb, protein, fat);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Successfully added!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
