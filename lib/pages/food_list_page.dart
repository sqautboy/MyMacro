import 'package:diet_macro/models/food_model.dart';
import 'package:diet_macro/services/api.service.dart';
import 'package:flutter/material.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  final List<FoodNutrition> foods = [];
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
                      labelText: 'Search',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () async {
                      String foodName = textController.text;
                      print('검색한 음식 이름: $foodName');
                      List<FoodNutrition> fetchedFoods = await fetchFoodNutrition(foodName); // await 추가
                      setState(() {
                        foods.addAll(fetchedFoods); // 가져온 데이터 추가
                      });
                    },
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];

                return ListTile(
                  title: Text(food.name),
                  subtitle: Text(food.servingUnit),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
