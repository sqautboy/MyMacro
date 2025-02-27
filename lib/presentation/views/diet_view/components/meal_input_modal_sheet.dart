import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../diet_view_model.dart';

class MealInputModalSheet extends StatefulWidget {
  const MealInputModalSheet({super.key});

  @override
  MealInputModalSheetState createState() => MealInputModalSheetState();
}

class MealInputModalSheetState extends State<MealInputModalSheet> {
  final _caloriesController = TextEditingController();
  final _carbController = TextEditingController();
  final _proteinController = TextEditingController();
  final _fatController = TextEditingController();

  @override
  void dispose() {
    _caloriesController.dispose();
    _carbController.dispose();
    _proteinController.dispose();
    _fatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextField(
            decoration: InputDecoration(labelText: 'Meal Name'),
          ),
          TextField(
            controller: _caloriesController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Calories'),
          ),
          TextField(
            controller: _carbController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Carb'),
          ),
          TextField(
            controller: _proteinController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Protein'),
          ),
          TextField(
            controller: _fatController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Fat'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final calories = int.tryParse(_caloriesController.text) ?? 0;
              final carb = int.tryParse(_carbController.text) ?? 0;
              final protein = int.tryParse(_proteinController.text) ?? 0;
              final fat = int.tryParse(_fatController.text) ?? 0;

              context.read<DietViewModel>().addMeal(calories, carb, protein, fat);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
