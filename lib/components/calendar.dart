import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime _focusedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime? _selectedDay;

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
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
          const SizedBox(height: 28),
          Text('Selected Day: ${_selectedDay ?? DateTime.now()}'),
        ],
      ),
    );
  }
}
