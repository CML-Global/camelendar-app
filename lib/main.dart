import 'package:camelendar/models/event_Model.dart';
import 'package:camelendar/pages/auth.dart';
import 'package:camelendar/pages/chat.dart';
import 'package:camelendar/pages/eventMap.dart';
import 'package:camelendar/pages/eventsDisplay.dart';
import 'package:camelendar/pages/home.dart';
import 'package:camelendar/pages/messaging.dart';
import 'package:camelendar/pages/organiser_publisher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
  List<Event> event;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Cairo'),
      home: EventMap(eventList: [],),
      initialRoute: '/',
      routes: {
        // '/': (context) => const HomePage(),
        '/home': (context) => HomePage(),
        '/auth': (context) => Auth(),
        '/events': (context) => const EventDisplay(),
        '/org_pub': (context) => const OrganiserPublisher(),
        '/chat': (context) => const ChatPage(),
        '/message': (context) => const MessagingPage(),
      },
    );
  }
}
