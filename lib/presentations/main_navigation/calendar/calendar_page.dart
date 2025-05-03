import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:jci_manila_v2/app/components/widget_custom_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          WidgetCustomAppbar(
            title: 'Calendar',
            textColor: Colors.white,
            fontSize: 20,
            isbold: true,
          ),
          const Gap(10),
          Expanded(
            child: TableCalendar(
              rowHeight: 70,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              availableGestures: AvailableGestures.horizontalSwipe,
              availableCalendarFormats: const {CalendarFormat.month: 'Month'},
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  return _buildDayCell(day);
                },
                todayBuilder: (context, day, focusedDay) {
                  return _buildDayCell(day, isToday: true);
                },
                selectedBuilder: (context, day, focusedDay) {
                  return _buildDayCell(day, isSelected: true);
                },
                outsideBuilder: (context, day, focusedDay) {
                  return _buildDayCell(day, isOutside: true);
                },
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                dowTextFormatter:
                    (date, locale) => DateFormat.E(locale).format(date)[0],
                decoration: const BoxDecoration(),
                weekdayStyle: const TextStyle(fontWeight: FontWeight.bold),
                weekendStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              calendarStyle: const CalendarStyle(
                isTodayHighlighted: true,
                outsideTextStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayCell(
    DateTime day, {
    bool isToday = false,
    bool isSelected = false,
    bool isOutside = false,
  }) {
    Color borderColor = Colors.grey.shade400;
    Color bgColor = Colors.white;
    Color textColor = Colors.black;

    if (isToday) {
      bgColor = Colors.blue.shade100;
    }

    if (isSelected) {
      bgColor = Colors.blue.shade300;
      textColor = Colors.black;
    }

    if (isOutside) {
      textColor = Colors.grey.shade400;
    }

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(
          bottom: BorderSide(width: 1, color: borderColor),
          right: BorderSide(width: 0.5, color: borderColor),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        '${day.day}',
        style: TextStyle(
          color: textColor,
          fontWeight:
              isToday || isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
