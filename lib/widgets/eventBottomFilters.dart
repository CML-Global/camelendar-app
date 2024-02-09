import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef OnTabChanged = void Function(int index);

class EventsBottomNavbar extends StatefulWidget {
  final OnTabChanged onTabChanged;

  const EventsBottomNavbar({
    super.key,
    required this.onTabChanged,
  });

  @override
  State<EventsBottomNavbar> createState() => Events_BottomNavbarState();
}

class Events_BottomNavbarState extends State<EventsBottomNavbar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedIconTheme: IconThemeData(color: Colors.red),
      unselectedItemColor: Colors.white,
        backgroundColor: Color.fromRGBO(15, 18, 32, 1),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            widget.onTabChanged(index);
          });
        },
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
          
            icon: Icon(
              Icons.list_sharp,
              
            ),
            label: 'Time',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.event_outlined,
             
                
              ),
              label: 'Time'),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.mapLocationDot,
              
                size: 20,
              ),
              label: 'Time'),
        ]);
  }
}
