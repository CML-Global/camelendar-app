import 'package:camelendar/pages/auth.dart';
import 'package:camelendar/pages/chat.dart';
import 'package:camelendar/pages/eventsDisplay.dart';
import 'package:camelendar/pages/home.dart';
import 'package:camelendar/pages/messaging.dart';
import 'package:camelendar/pages/organiser_publisher.dart';
import 'package:camelendar/pages/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isSignedIn = prefs.getBool('isSignedIn') ?? false;
  runApp(MyApp(isSignedIn: isSignedIn));
}

class MyApp extends StatefulWidget {
  final bool isSignedIn;

  const MyApp({super.key, required this.isSignedIn});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Cairo'),
      home:  HomePage() ,
      initialRoute: '/',
      routes: {
        '/home': (context) => HomePage(),
        '/auth': (context) => Auth(),
        '/events': (context) => const EventDisplay(),
        '/org_pub': (context) => const OrganiserPublisher(),
        '/chat': (context) => const ChatPage(),
        '/message': (context) => const MessagingPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
