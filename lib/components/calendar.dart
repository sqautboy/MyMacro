import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:diet_macro/models/isar_service.dart'; // IsarService import added
import 'package:diet_macro/models/isar_data.dart'; // DailyData import added

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime _focusedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toLocal();
  DateTime? _selectedDay;
  DailyData? _dailyData; // Stores DailyData for the selected date

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      color: Colors.grey[300],
      child: Column(
        children: [
          TableCalendar(
            // 캘린더 바디 스타일
            calendarStyle: const CalendarStyle(
              defaultTextStyle: TextStyle(fontWeight: FontWeight.bold), // 기본 날짜 텍스트 굵게
              weekendTextStyle: TextStyle(fontWeight: FontWeight.bold), // 주말 날짜 텍스트 굵게
              selectedTextStyle: TextStyle(fontWeight: FontWeight.bold), // 선택된 날짜 텍스트 굵게
              todayTextStyle: TextStyle(fontWeight: FontWeight.bold), // 오늘 날짜 텍스트 굵게
            ),
            // 캘린더 헤더 스타일
            headerStyle: const HeaderStyle(
              titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // 월, 년도 텍스트 스타일
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
            },
          ),
          const SizedBox(height: 50),
          // Text(
          //     'Selected Day: ${_selectedDay ?? DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toLocal()}'),

          // 선택한 날짜의 DailyData 표시
          if (_dailyData != null) ...[
            // _dailyData가 null이 아닌 경우에만 표시
            Text('Calories: ${_dailyData!.calories}'),
            Text('Carb: ${_dailyData!.carb}'),
            Text('Protein: ${_dailyData!.protein}'),
            Text('Fat: ${_dailyData!.fat}'),
          ] else ...[
            Text('No data available for selected day'),
          ],
        ],
      ),
    );
  }
}
