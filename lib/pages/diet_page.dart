import 'package:diet_macro/components/bottom_modal_sheet.dart';
import 'package:diet_macro/components/nutrition_tile.dart';
import 'package:diet_macro/models/isar_data.dart'; // isar_data.dart import
import 'package:diet_macro/models/isar_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DietPage extends StatefulWidget {
  const DietPage({super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  TargetData targetData = TargetData(); // Initialize with default values
  DailyData dailyData = DailyData(); // Initialize with default values
  bool loading = true; // Add a loading state

  double get _caloriesPercent => _calculatePercent(dailyData.calories, targetData.targetCalories);
  double get _carbPercent => _calculatePercent(dailyData.carb, targetData.targetCarb);
  double get _proteinPercent => _calculatePercent(dailyData.protein, targetData.targetProtein);
  double get _fatPercent => _calculatePercent(dailyData.fat, targetData.targetFat);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Isar 데이터 로드
  Future<void> _loadData() async {
    targetData = await IsarService().getTargetData() ?? TargetData();
    dailyData = await _getDailyDataForToday();

    // D E B U G
    print("DailyData: ${dailyData.calories}칼로리, ${dailyData.carb}탄수화물, ${dailyData.protein}단백질, ${dailyData.fat}지방");

    // 데이터 로드 후 UI 업데이트
    setState(() {
      loading = false;
    });
  }

  // 오늘 날짜의 DailyData 가져오기
  Future<DailyData> _getDailyDataForToday() async {
    final now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final existingData = await IsarService().getDailyDataByDate(now);

    if (existingData != null) {
      // 기존 데이터가 있을 경우, 기존 데이터에 더하기
      existingData.calories += dailyData.calories;
      existingData.carb += dailyData.carb;
      existingData.protein += dailyData.protein;
      existingData.fat += dailyData.fat;

      // 업데이트된 데이터를 저장
      await IsarService().updateDailyData(existingData);
      return existingData;
    }

    return DailyData(); // 기존 데이터가 없으면 새로운 DailyData 반환
  }

  // 진행률 계산 함수
  double _calculatePercent(int current, int target) {
    if (current >= target) {
      return 1;
    } else {
      return 1 - (target - current) / target;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
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
                    setState(() {
                      dailyData
                        ..calories += calories
                        ..carb += carb
                        ..protein += protein
                        ..fat += fat;
                      print(
                          "현재 날짜의 DailyData 업데이트된 값: ${dailyData.calories}칼로리, ${dailyData.carb}���수화물, ${dailyData.protein}단백질, ${dailyData.fat}지방");
                      print("날짜: ${dailyData.date}");

                      IsarService().updateDailyData(dailyData);
                    });
                  },
                );
              },
            );
          }),
      body: loading
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
                        _buildCircularPercentIndicator(
                            _caloriesPercent, Colors.red.shade600, "${dailyData.calories}", 'Calories'),
                        const SizedBox(width: 20),
                        // Carb
                        _buildCircularPercentIndicator(
                            _carbPercent, Colors.green.shade600, "${dailyData.carb} g", 'Carb'),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Protein
                        _buildCircularPercentIndicator(
                            _proteinPercent, Colors.blue.shade800, "${dailyData.protein} g", 'Protein'),
                        const SizedBox(width: 20),
                        // Fat
                        _buildCircularPercentIndicator(_fatPercent, Colors.brown.shade600, "${dailyData.fat} g", 'Fat'),
                      ],
                    ),
                    const SizedBox(height: 50),
                    NutritionTile(
                      dividerColor: Colors.red.shade600,
                      nutrition: "Calories",
                      status: '${dailyData.calories} / ${targetData.targetCalories} kcal',
                      percentage: (dailyData.calories / targetData.targetCalories * 100).toInt(),
                    ),
                    const SizedBox(height: 20),
                    NutritionTile(
                      dividerColor: Colors.green.shade600,
                      nutrition: "Carb",
                      status: '${dailyData.carb} / ${targetData.targetCarb} g',
                      percentage: (dailyData.carb / targetData.targetCarb * 100).toInt(),
                    ),
                    const SizedBox(height: 20),
                    NutritionTile(
                      dividerColor: Colors.blue.shade800,
                      nutrition: "Protein",
                      status: '${dailyData.protein} / ${targetData.targetProtein} g',
                      percentage: (dailyData.protein / targetData.targetProtein * 100).toInt(),
                    ),
                    const SizedBox(height: 20),
                    NutritionTile(
                      dividerColor: Colors.brown.shade600,
                      nutrition: "Fat",
                      status: '${dailyData.fat} / ${targetData.targetFat} g',
                      percentage: (dailyData.fat / targetData.targetFat * 100).toInt(),
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
      backgroundColor: Color.fromARGB(100, 255, 255, 255),
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
