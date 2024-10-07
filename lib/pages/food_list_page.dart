import 'package:diet_macro/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class FoodListPage extends StatelessWidget {
  const FoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // FoodProvider 상태를 가져옴
    final foodProvider = context.watch<FoodProvider>();
    final textController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
                    showCursor: false,
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
                      final foodName = textController.text;
                      foodProvider.clearFoods(); // 이전 검색 결과 초기화
                      context.read<FoodProvider>().fetchFoodNutritionProvider(foodName); // 음식 데이터 가져오기
                    },
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: foodProvider.isLoading
                ? Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView.builder(
                        itemCount: 10, // 임의의 항목 개수
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: ListTile(
                              title: Container(
                                width: double.infinity,
                                height: 18,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                padding: const EdgeInsets.only(right: 100),
                                height: 12,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                :
                // Shimmer 위젯 사용

                Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                      itemCount: foodProvider.foods.length,
                      itemBuilder: (context, index) {
                        final food = foodProvider.foods[index];

                        return ListTile(
                          title: Text(food.name),
                          subtitle: Text(food.servingUnit),
                        );
                      },
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
