import 'package:diet_macro/components/nutrition_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:diet_macro/models/isar_service.dart';
import 'package:diet_macro/models/isar_data.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime _focusedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toLocal();
  DateTime? _selectedDay;
  DailyData? _dailyData;
  TargetData? _targetData; // TargetData 추가

  @override
  void initState() {
    super.initState();
    _loadTargetData(); // TargetData 로드
  }

  // TargetData 로드 함수
  Future<void> _loadTargetData() async {
    _targetData = await IsarService().getTargetData();
    setState(() {}); // UI 업데이트
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: Colors.grey[300],
        child: Column(
          children: [
            TableCalendar(
              // ... (캘린더 스타일 및 속성 설정)
              calendarStyle: CalendarStyle(
                tablePadding: const EdgeInsets.all(8),
                defaultTextStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold), // 기본 날짜 텍스트 굵게
                weekendTextStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold), // 주말 날짜 텍스트 굵게
                selectedTextStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold), // 선택된 날짜 텍스트 굵게
                todayTextStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              ),

              // 캘린더 헤더 스타일
              headerStyle: HeaderStyle(
                rightChevronIcon: Icon(Icons.arrow_circle_right, color: Colors.grey[800]),
                leftChevronIcon: Icon(Icons.arrow_circle_left, color: Colors.grey[800]),
                headerPadding: const EdgeInsets.only(bottom: 12, left: 60, right: 60),
                titleTextFormatter: (date, locale) => date.month.toString(),
                titleTextStyle: GoogleFonts.roboto(
                  fontWeight: FontWeight.w900,
                  fontSize: 36,
                ), // 월, 년도 텍스트 스타일
                formatButtonVisible: false, // 형식 버튼 숨기기
                titleCentered: true, // 제목 중앙 정렬
              ),
              // 캘린더 속성
              firstDay: DateTime.utc(2024, 1, 1),
              lastDay: DateTime.utc(2040, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.month,
              availableCalendarFormats: const {CalendarFormat.month: 'Month'}, // Disable format button
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },

              onDaySelected: (selectedDay, focusedDay) async {
                setState(() {
                  _selectedDay = DateTime(selectedDay.year, selectedDay.month, selectedDay.day).toLocal();
                  _focusedDay = focusedDay;
                });

                _dailyData = await IsarService().getDailyDataByDate(_selectedDay!);

                setState(() {}); // UI 업데이트
              },
            ),
            const SizedBox(height: 8),

            // 선택한 날짜의 DailyData 표시
            if (_dailyData == null) ...[
              Container(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                  // 텍스트를 가운데 정렬
                  child: Text(
                    'No Data',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 60,
                      color: Colors.grey[80],
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ] else ...[
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      NutritionTile(
                        dividerColor: Colors.red.shade600,
                        nutrition: "Calories",
                        status: '${_dailyData?.calories} / ${_targetData?.targetCalories ?? 0} kcal',
                        percentage: (_targetData != null && _dailyData!.calories > 0)
                            ? (_dailyData!.calories / _targetData!.targetCalories * 100).toInt()
                            : 0,
                      ),
                      const SizedBox(height: 12),
                      NutritionTile(
                        dividerColor: Colors.green.shade600,
                        nutrition: "Carb",
                        status: '${_dailyData!.carb} / ${_targetData?.targetCarb ?? 0} g',
                        percentage: (_targetData != null && _dailyData!.carb > 0)
                            ? (_dailyData!.carb / _targetData!.targetCarb * 100).toInt()
                            : 0,
                      ),
                      const SizedBox(height: 12),
                      NutritionTile(
                        dividerColor: Colors.blue.shade800,
                        nutrition: "Protein",
                        status: '${_dailyData!.protein} / ${_targetData?.targetProtein ?? 0} g',
                        percentage: (_targetData != null && _dailyData!.protein > 0)
                            ? (_dailyData!.protein / _targetData!.targetProtein * 100).toInt()
                            : 0,
                      ),
                      const SizedBox(height: 12),
                      NutritionTile(
                        dividerColor: Colors.brown.shade600,
                        nutrition: "Fat",
                        status: '${_dailyData!.fat} / ${_targetData?.targetFat ?? 0} g',
                        percentage: (_targetData != null && _dailyData!.fat > 0)
                            ? (_dailyData!.fat / _targetData!.targetFat * 100).toInt()
                            : 0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
