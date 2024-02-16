import 'package:flutter/material.dart';

class EventModel {
  // String title;
  // String role;
  // String description;
  // String location;
  // String date_start;
  // String date_end;
  // String logo;
  // String public;
  // String type;
  // String theme;
  // String date;
  // String sponsors;
  String title;
  String photo;
  String date;
  String location;

  EventModel({
    required this.title,
    required this.photo,
    required this.date,
    required this.location,
  });

  static List<EventModel> getEvents() {
    List<EventModel> events = [];

    events.add(EventModel(
        title: 'Item3',
        photo: 'assets/images/event_pic.jpg',
        date: 'jun12 - jul14',
        location: 'location',
        ));
    events.add(EventModel(
        title: 'item4',
        photo: 'assets/images/event_pic2.jpg',
        date: 'jun12 - jul14',
        location: 'location',
        ));
    return events;
  }
}
