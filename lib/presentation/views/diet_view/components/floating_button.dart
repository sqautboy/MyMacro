import 'package:diet_macro/presentation/views/diet_view/diet_view_model.dart';
import 'package:flutter/material.dart';
import 'package:diet_macro/presentation/widgets/bottom_modal_sheet.dart';

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
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.65,
          ),
          builder: (context) {
            return BottomModalSheet(
              onAddPressed: (calories, carb, protein, fat) async {
                dietViewModel.updateDailyData(calories, carb, protein, fat);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Successfully added your macro!'),
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
