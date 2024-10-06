import 'package:diet_macro/models/food_model.dart';
import 'package:diet_macro/services/api.service.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  final List<FoodNutrition> foods = [];
  final textController = TextEditingController();

  // fetch 로딩 상태 체크
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      foods.clear(); // 리스트 초기화
                      String foodName = textController.text;
                      print('검색한 음식 이름: $foodName');

                      // 로딩 중
                      setState(() {
                        isLoading = true;
                      });

                      List<FoodNutrition> fetchedFoods = await fetchFoodNutrition(foodName); // await 추가

                      setState(() {
                        foods.addAll(fetchedFoods); // 검색된 음식 리스트 추가
                        isLoading = false;
                      });
                    },
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: isLoading
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
                      itemCount: foods.length,
                      itemBuilder: (context, index) {
                        final food = foods[index];

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
