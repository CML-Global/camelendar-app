import 'package:camelendar/models/event_Model.dart';
import 'package:flutter/material.dart';
import 'package:camelendar/pages/eventInfo.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventCalendar extends StatelessWidget {
  const EventCalendar({super.key, required this.eventList});

  final List<Event> eventList;
  Color _parseColor(String colorString) {
    final colorInt = int.parse(colorString.replaceAll('#', '0xff'), radix: 16);
    return Color(colorInt);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SfCalendar(
        view: CalendarView.timelineMonth,
        backgroundColor: Colors.white,
        dataSource: EventData(getAppointments(eventList)),
        onTap: (CalendarTapDetails details) {
          if (details.appointments != null &&
              details.appointments!.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    EventInfo(title: details.appointments![0].subject),
              ),
            );
          }
        },
      ),
    );
  }
}

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceFirst('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

List<Appointment> getAppointments(List<Event> events) {
  List<Appointment> appointments = <Appointment>[];
  for (Event event in events) {
    Color color = colorFromHex(event.color);
    appointments.add(Appointment(
      startTime: event.dateStart,
      endTime: event.dateEnd,
      subject: event.title,
      color:color,
    ));
  }
  return appointments;
}

class EventData extends CalendarDataSource {
  EventData(List<Appointment> source) {
    appointments = source;
  }
}
