import 'package:flutter/material.dart';
import 'package:diet_macro/presentation/widgets/bottom_modal_sheet.dart';
import 'package:diet_macro/providers/diet_provider.dart';

class MyFloatingActionButton extends StatelessWidget {
  final DietProvider dietProvider;

  const MyFloatingActionButton({
    super.key,
    required this.dietProvider,
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
                dietProvider.updateDailyData(calories, carb, protein, fat);
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
