import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';
// Import collection package if necessary (for older Dart versions)
// import 'package:collection/collection.dart';
import 'package:camelendar/models/event_Model.dart';

class EventCalendar extends StatelessWidget {
  final List<Event> eventList;

  const EventCalendar({Key? key, required this.eventList}) : super(key: key);

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
            final Event? event = eventList.firstWhereOrNull(
              (e) => e.title == details.appointments![0].subject,
            );

            // Check if an event was found before showing the dialog
            if (event != null) {
              showDialog(
              // barrierColor: Colors.white,
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: AlertDialog(
                    surfaceTintColor: Color.fromRGBO(6, 12, 45, 1),
                    backgroundColor: Color.fromRGBO(6, 12, 45, 1),
                      title: Text(event.title,
                          style: TextStyle(color: Colors.white)),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text(event.description,
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 5),
                            Text(
                                'Date: ${DateFormat('yyyy-MM-dd').format(event.dateStart)}',
                                style: TextStyle(color: Colors.white)),
                            SizedBox(height: 5),
                            Text('Location: ${event.location}',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close',style: TextStyle(color: Colors.white),),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }

  List<Appointment> getAppointments(List<Event> events) {
    return events.map<Appointment>((event) {
      return Appointment(
        startTime: event.dateStart,
        endTime: event.dateEnd,
        subject: event.title,
        color: colorFromHex(event.color),
      );
    }).toList();
  }

  Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceFirst('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

}

class EventData extends CalendarDataSource {
  EventData(List<Appointment> source) {
    appointments = source;
  }
}
