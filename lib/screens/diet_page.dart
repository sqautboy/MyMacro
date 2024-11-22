// import 'package:diet_macro/providers/diet_provider.dart';
// import 'package:diet_macro/utils/color_set.dart';
// import 'package:diet_macro/widgets/bottom_modal_sheet.dart';
// import 'package:diet_macro/widgets/nutrition_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:provider/provider.dart';

// class DietPage extends StatefulWidget {
//   const DietPage({super.key});

//   @override
//   State<DietPage> createState() => _DietPageState();
// }

// class _DietPageState extends State<DietPage> {
//   @override
//   void initState() {
//     print("---------------initState 호출 완료 -----------------");
//     super.initState();
//     context.read<DietProvider>().loadData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dietProvider = context.watch<DietProvider>();

//     return Scaffold(
//       backgroundColor: mainColor,
//       floatingActionButton: FloatingActionButton(
//           tooltip: 'Add Nutrion',
//           backgroundColor: Colors.black,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(50),
//           ),
//           child: const Icon(Icons.add, color: Colors.white),
//           onPressed: () {
//             showModalBottomSheet(
//               constraints: BoxConstraints(
//                 maxHeight: MediaQuery.of(context).size.height * 0.65, // 화면 높이의 80%
//               ),
//               isScrollControlled: true,
//               context: context,
//               builder: (context) {
//                 return BottomModalSheet(
//                   onAddPressed: (calories, carb, protein, fat) async {
//                     // 콜백 함수에서 Isar 데이터 업데이트
//                     dietProvider.updateDailyData(calories, carb, protein, fat);

//                     // 팝업 메시지 표시
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Successfully added your macro!'),
//                         duration: Duration(seconds: 2),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           }),
//       body: dietProvider.loading
//           ? const Center(child: CircularProgressIndicator()) // Show loading indicator while loading
//           : Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         // Calories
//                         _buildCircularPercentIndicator(
//                           dietProvider.caloriesPercent,
//                           caloriesColor,
//                           "${dietProvider.dailyData.calories}",
//                           'Calories',
//                         ),
//                         const SizedBox(width: 20),
//                         // Carb
//                         _buildCircularPercentIndicator(
//                           dietProvider.carbPercent,
//                           carbColor,
//                           "${dietProvider.dailyData.carb} g",
//                           'Carb',
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         // Protein
//                         _buildCircularPercentIndicator(
//                           dietProvider.proteinPercent,
//                           proteinColor,
//                           "${dietProvider.dailyData.protein} g",
//                           'Protein',
//                         ),
//                         const SizedBox(
//                           width: 20,
//                         ),
//                         // Fat
//                         _buildCircularPercentIndicator(
//                           dietProvider.fatPercent,
//                           fatColor,
//                           "${dietProvider.dailyData.fat} g",
//                           'Fat',
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     NutritionTile(
//                       dividerColor: const Color.fromARGB(255, 160, 25, 23),
//                       nutrition: "Calories",
//                       status: '${dietProvider.dailyData.calories} / ${dietProvider.targetData.targetCalories} kcal',
//                       percentage:
//                           (dietProvider.dailyData.calories / dietProvider.targetData.targetCalories * 100).toInt(),
//                     ).animate().fade(duration: const Duration(milliseconds: 200)),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     NutritionTile(
//                       dividerColor: const Color.fromARGB(255, 26, 121, 31),
//                       nutrition: "Carb",
//                       status: '${dietProvider.dailyData.carb} / ${dietProvider.targetData.targetCarb} g',
//                       percentage: (dietProvider.dailyData.carb / dietProvider.targetData.targetCarb * 100).toInt(),
//                     ).animate().fade(duration: const Duration(milliseconds: 200)),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     NutritionTile(
//                       dividerColor: const Color.fromARGB(255, 14, 74, 144),
//                       nutrition: "Protein",
//                       status: '${dietProvider.dailyData.protein} / ${dietProvider.targetData.targetProtein} g',
//                       percentage:
//                           (dietProvider.dailyData.protein / dietProvider.targetData.targetProtein * 100).toInt(),
//                     ).animate().fade(duration: const Duration(milliseconds: 200)),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     NutritionTile(
//                       dividerColor: const Color.fromARGB(255, 124, 86, 14),
//                       nutrition: "Fat",
//                       status: '${dietProvider.dailyData.fat} / ${dietProvider.targetData.targetFat} g',
//                       percentage: (dietProvider.dailyData.fat / dietProvider.targetData.targetFat * 100).toInt(),
//                     ).animate().fade(duration: const Duration(milliseconds: 200)),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   // CircularPercentIndicator를 생성하는 함수
//   Widget _buildCircularPercentIndicator(double percent, Color progressColor, String centerText1, String centerText2) {
//     return CircularPercentIndicator(
//       radius: 52.0,
//       lineWidth: 13,
//       animation: true,
//       animationDuration: 1000,
//       backgroundColor: const Color.fromARGB(100, 255, 255, 255),
//       percent: percent,
//       center: Column(
//         mainAxisAlignment: MainAxisAlignment.center, // 텍스트 세로 가운데 정렬
//         children: [
//           Text(
//             centerText1, // 첫 번째 줄 텍스트
//             style: GoogleFonts.dmSerifDisplay(
//               fontWeight: FontWeight.w500,
//               fontSize: 16,
//             ),
//           ),
//           Text(
//             centerText2, // 두 번째 줄 텍스트
//             style: GoogleFonts.roboto(
//               color: Colors.grey[800],
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//       progressColor: progressColor,
//       circularStrokeCap: CircularStrokeCap.round,
//     );
//   }
// }
import 'package:diet_macro/utils/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'package:diet_macro/providers/diet_provider.dart';
import 'package:diet_macro/utils/color_set.dart';
import 'package:diet_macro/widgets/bottom_modal_sheet.dart';
import 'package:diet_macro/widgets/nutrition_tile.dart';

class DietPage extends StatefulWidget {
  const DietPage({super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  @override
  void initState() {
    super.initState();
    context.read<DietProvider>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    final dietProvider = context.watch<DietProvider>();
    final dietProviderRead = context.read<DietProvider>();

    return Scaffold(
      backgroundColor: mainColor,
      floatingActionButton: _buildFloatingActionButton(context, dietProvider, dietProviderRead),
      body: dietProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : _buildContent(context, dietProvider, dietProviderRead),
    );
  }

  // FloatingActionButton 생성
  FloatingActionButton _buildFloatingActionButton(
      BuildContext context, DietProvider dietProvider, DietProvider dietProviderRead) {
    return FloatingActionButton(
      tooltip: 'Add Nutrition',
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
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
                dietProviderRead.updateDailyData(calories, carb, protein, fat);
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

  // 메인 콘텐츠
  Widget _buildContent(BuildContext context, DietProvider dietProvider, DietProvider dietProviderRead) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildRowIndicators(
              dietProviderRead.caloriesPercent,
              caloriesColor,
              dietProviderRead.dailyData.calories,
              "Calories",
              dietProviderRead.carbPercent,
              carbColor,
              "${dietProviderRead.dailyData.carb} g",
              "Carb",
            ),
            const SizedBox(height: 40),
            _buildRowIndicators(
              dietProviderRead.proteinPercent,
              proteinColor,
              dietProviderRead.dailyData.protein,
              "Protein",
              dietProviderRead.fatPercent,
              fatColor,
              "${dietProviderRead.dailyData.fat} g",
              "Fat",
            ),
            const SizedBox(height: 50),
            _buildAnimatedNutritionTile(
              "Calories",
              dietProviderRead.dailyData.calories,
              dietProviderRead.targetData.targetCalories,
              const Color.fromARGB(255, 160, 25, 23),
            ),
            _buildAnimatedNutritionTile(
              "Carb",
              dietProviderRead.dailyData.carb,
              dietProviderRead.targetData.targetCarb,
              const Color.fromARGB(255, 26, 121, 31),
            ),
            _buildAnimatedNutritionTile(
              "Protein",
              dietProviderRead.dailyData.protein,
              dietProviderRead.targetData.targetProtein,
              const Color.fromARGB(255, 14, 74, 144),
            ),
            _buildAnimatedNutritionTile(
              "Fat",
              dietProviderRead.dailyData.fat,
              dietProviderRead.targetData.targetFat,
              const Color.fromARGB(255, 124, 86, 14),
            ),
          ],
        ),
      ),
    );
  }

  // Animated Nutrition Tile 생성
  Widget _buildAnimatedNutritionTile(
    String nutrition,
    int currentValue,
    int targetValue,
    Color dividerColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: NutritionTile(
        dividerColor: dividerColor,
        nutrition: nutrition,
        status: "$currentValue / $targetValue",
        percentage: (currentValue / targetValue * 100).toInt(),
      ).animate().fade(duration: const Duration(milliseconds: 200)),
    );
  }

  // CircularPercentIndicator 두 개가 들어간 Row
  Widget _buildRowIndicators(
    double percent1,
    Color color1,
    dynamic centerText1,
    String title1,
    double percent2,
    Color color2,
    dynamic centerText2,
    String title2,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCircularPercentIndicator(percent1, color1, "$centerText1", title1),
        _buildCircularPercentIndicator(percent2, color2, "$centerText2", title2),
      ],
    );
  }

  // CircularPercentIndicator 생성
  Widget _buildCircularPercentIndicator(
    double percent,
    Color progressColor,
    String centerText1,
    String centerText2,
  ) {
    return CircularPercentIndicator(
      radius: 52.0,
      lineWidth: 13,
      animation: true,
      animationDuration: 1000,
      backgroundColor: const Color.fromARGB(100, 255, 255, 255),
      percent: percent,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            centerText1,
            style: GoogleFonts.dmSerifDisplay(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Text(
            centerText2,
            style: GoogleFonts.roboto(
              color: Colors.grey[800],
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
