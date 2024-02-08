import 'package:camelendar/pages/auth.dart';
import 'package:camelendar/pages/eventsDisplay.dart';
import 'package:camelendar/pages/home.dart';
import 'package:camelendar/pages/organiser_publisher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: HomePage(),
      initialRoute: '/',
      routes: {
        // '/': (context) => const HomePage(),
        '/home': (context) => HomePage(),
        '/auth': (context) => Auth(),
        '/events': (context) => const EventDisplay(),
        '/org_pub': (context) => const OrganiserPublisher(),
      },
    );
  }
}
