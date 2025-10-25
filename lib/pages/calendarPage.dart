import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension StringCasingExtension on String {
  String capitalizeEachWord() {
    return split(' ')
        .map((word) => word.isNotEmpty
        ? word[0].toUpperCase() + word.substring(1)
        : '')
        .join(' ');
  }
}

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR', null);
  }
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: buildCalendarBody(today, _onDaySelected),
    );
  }
}

buildCalendarBody(today, _onDaySelected) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      child: TableCalendar(
        locale: "pt_BR",
        rowHeight: 90,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextFormatter: (date, locale) {
            final formatted = DateFormat('MMMM yyyy', locale).format(date);
            return formatted.capitalizeEachWord();
          }
        ),
        availableGestures: AvailableGestures.all,
        selectedDayPredicate: (day)=> isSameDay(day, today),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: const TextStyle(fontWeight: FontWeight.w500),
          weekendStyle: const TextStyle(fontWeight: FontWeight.w500),
          dowTextFormatter: (date, locale) {
            final text = DateFormat.E(locale).format(date); // e.g. "seg"
            return text.capitalizeEachWord(); // "Seg"
          },
        ),
        focusedDay: today,
        firstDay: DateTime.utc(2024, 1, 1),
        lastDay: DateTime.utc(2044, 12, 31),
        onDaySelected: _onDaySelected,
      ),
    ),
  );
}
