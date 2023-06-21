import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Padding(
          padding: EdgeInsets.all(35),
          child: Text('Calendar'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Selected Day= " + today.toString().split(" ")[0]),
            Container(
              child: TableCalendar(
                rowHeight: 43,
                headerStyle: const HeaderStyle(titleCentered: true),
                availableGestures: AvailableGestures.all,
                firstDay: DateTime.utc(2001),
                lastDay: DateTime.utc(2050),
                focusedDay: today,
                selectedDayPredicate: (day) => isSameDay(day, today),
                onDaySelected: _onDaySelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
