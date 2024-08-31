import 'package:diet_macro/components/bottom_modal_sheet.dart';
import 'package:diet_macro/components/nutrition_tile.dart';
import 'package:diet_macro/diet_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class DietPage extends StatefulWidget {
  const DietPage({super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  @override
  void initState() {
    print("---------------initState 호출 완료 -----------------");
    super.initState();
    context.read<DietProvider>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    final dietProvider = context.watch<DietProvider>();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add Nutrion',
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(Icons.add, color: Colors.white),
          onPressed: () {
            showModalBottomSheet(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.65, // 화면 높이의 80%
              ),
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return BottomModalSheet(
                  onAddPressed: (calories, carb, protein, fat) async {
                    // 콜백 함수에서 Isar 데이터 업데이트
                    dietProvider.updateDailyData(calories, carb, protein, fat);

                    // 팝업 메시지 표시
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Successfully added your macro!'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                );
              },
            );
          }),
      body: dietProvider.loading
          ? const Center(child: CircularProgressIndicator()) // Show loading indicator while loading
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Calories
                        _buildCircularPercentIndicator(dietProvider.caloriesPercent, Colors.red.shade600,
                            "${dietProvider.dailyData.calories}", 'Calories'),
                        const SizedBox(width: 20),
                        // Carb
                        _buildCircularPercentIndicator(dietProvider.carbPercent, Colors.green.shade600,
                            "${dietProvider.dailyData.carb} g", 'Carb'),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Protein
                        _buildCircularPercentIndicator(dietProvider.proteinPercent, Colors.blue.shade800,
                            "${dietProvider.dailyData.protein} g", 'Protein'),
                        const SizedBox(
                          width: 20,
                        ),
                        // Fat
                        _buildCircularPercentIndicator(
                            dietProvider.fatPercent, Colors.brown.shade600, "${dietProvider.dailyData.fat} g", 'Fat'),
                      ],
                    ),
                    const SizedBox(height: 50),
                    NutritionTile(
                      dividerColor: Colors.red.shade600,
                      nutrition: "Calories",
                      status: '${dietProvider.dailyData.calories} / ${dietProvider.targetData.targetCalories} kcal',
                      percentage:
                          (dietProvider.dailyData.calories / dietProvider.targetData.targetCalories * 100).toInt(),
                    ),
                    const SizedBox(height: 20),
                    NutritionTile(
                      dividerColor: Colors.green.shade600,
                      nutrition: "Carb",
                      status: '${dietProvider.dailyData.carb} / ${dietProvider.targetData.targetCarb} g',
                      percentage: (dietProvider.dailyData.carb / dietProvider.targetData.targetCarb * 100).toInt(),
                    ),
                    const SizedBox(height: 20),
                    NutritionTile(
                      dividerColor: Colors.blue.shade800,
                      nutrition: "Protein",
                      status: '${dietProvider.dailyData.protein} / ${dietProvider.targetData.targetProtein} g',
                      percentage:
                          (dietProvider.dailyData.protein / dietProvider.targetData.targetProtein * 100).toInt(),
                    ),
                    const SizedBox(height: 20),
                    NutritionTile(
                      dividerColor: Colors.brown.shade600,
                      nutrition: "Fat",
                      status: '${dietProvider.dailyData.fat} / ${dietProvider.targetData.targetFat} g',
                      percentage: (dietProvider.dailyData.fat / dietProvider.targetData.targetFat * 100).toInt(),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  // CircularPercentIndicator를 생성하는 함수
  Widget _buildCircularPercentIndicator(double percent, Color progressColor, String centerText1, String centerText2) {
    return CircularPercentIndicator(
      radius: 52.0,
      lineWidth: 13,
      animation: true,
      animationDuration: 1000,
      backgroundColor: const Color.fromARGB(100, 255, 255, 255),
      percent: percent,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 텍스트 세로 가운데 정렬
        children: [
          Text(
            centerText1, // 첫 번째 줄 텍스트
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Text(
            centerText2, // 두 번째 줄 텍스트
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        ],
      ),
      progressColor: progressColor,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
