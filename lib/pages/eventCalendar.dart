import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventCalendar extends StatelessWidget {
  const EventCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Scaffold(
        body: SfCalendar(
          
          view: CalendarView.timelineMonth,
          backgroundColor: Colors.transparent,
          dataSource: EventData(getEvents()),
        ),
      ),
    );
  }
}

List<Appointment> getEvents() {
  
  List<Appointment> events = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 12, 0, 0);
  final DateTime endTime = startTime.add(const Duration(days: 2));
  events.add(Appointment(
      startTime: DateTime(2024, 02, 9, 10),
      endTime: DateTime(2024, 02, 14, 10),
      subject: 'Camel Event',
      color: Colors.blue.shade900));
  events.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Camel efefe',
      color: Colors.blue.shade600));
  return events;
}

class EventData extends CalendarDataSource {
  EventData(List<Appointment> source) {
    appointments = source;
  }
}
