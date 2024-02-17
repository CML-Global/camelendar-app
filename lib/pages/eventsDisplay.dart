import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:camelendar/models/event_Model.dart';
import 'package:camelendar/pages/auth.dart';
import 'package:camelendar/pages/eventCalendar.dart';
import 'package:camelendar/pages/organiser_publisher.dart';
import 'package:camelendar/widgets/eventBottomFilters.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class EventDisplay extends StatefulWidget {
  const EventDisplay({Key? key}) : super(key: key);

  @override
  State<EventDisplay> createState() => _EventDisplayState();
}

class _EventDisplayState extends State<EventDisplay> {
  bool _showPastEvents = false;
  int footerIndex = 0;
  int _tabIndex = 0;
  List<Event> eventList = [];
  void _onTabChanged(int index) {
    setState(() {
      _tabIndex = index;
      print(_tabIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    getDataHttpPackage();
  }

  void getDataHttpPackage() async {
    try {
      final url =
          Uri.parse('https://camelworldmap.com/api/events?target=public');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          final List<dynamic> jsonData = jsonDecode(response.body);
          eventList =
              jsonData.map<Event>((json) => Event.fromJson(json)).toList();
        });
      } else {}
      // print(jsonDecode(response.body));
    } catch (e) {
      print(e);
    }
  }

  String formatDateString(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/hero_img.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildAppBar(context, 'Event', Color.fromRGBO(19, 22, 40, 1)),
        body: Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(95, 255, 255, 255))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            prefixIconColor: Colors.red,
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            iconColor: Colors.white,
                            icon: Icon(Icons.search),
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(190, 158, 158, 158))),
                      ),
                    ),
                    Column(
                      children: [
                        Switch(
                          inactiveThumbColor: Colors.yellow,
                          inactiveTrackColor: Colors.transparent,
                          value: _showPastEvents,
                          onChanged: (value) {
                            setState(() {
                              _showPastEvents = value;
                            });
                          },
                          activeTrackColor: Colors.transparent,
                          activeColor: Colors.orange,
                        ),
                      ],
                    ),
                    _showPastEvents
                        ? Text(
                            'Show Current \n Events',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          )
                        : Text(
                            'Show Past\n Events',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          )
                  ],
                ),
                _tabIndex == 0
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: eventList.length,
                          itemBuilder: (context, index) {
                            // final event = eventList[index];
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 15),
                              shadowColor:
                                  const Color.fromARGB(38, 255, 255, 255),
                              color: Colors.transparent,
                              surfaceTintColor:
                                  const Color.fromARGB(61, 0, 0, 0),
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    // Change Column to Row for horizontal layout
                                    children: [
                                      // Logo as a circle
                                      ClipOval(
                                        child: Image.network(
                                          "https://camelworldmap.com/uploads/logos/${eventList[index].logo}",
                                          width: 60, // Adjust size as needed
                                          height: 60, // Adjust size as needed
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                eventList[index].title,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Icon(FontAwesomeIcons.calendar,color: Colors.white,size: 8,),
                                                  SizedBox(width: 4,),
                                                  Text(
                                                    "Date: ${formatDateString(eventList[index].dateStart.toString())}",
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 8),
                                                  ),
                                                ],
                                              ),
                                              
                                              const SizedBox(height: 4),
                                              Row(
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.locationPin,
                                                    color: Colors.white,
                                                    size: 8,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    eventList[index].location,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 8),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Claim Ownership and Arrow Icon on the right
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          // IconButton(
                                          //   onPressed: () {},
                                          //   icon: FaIcon(
                                          //     Icons.arrow_right_outlined,
                                          //     size: 20,
                                          //     color: Colors.red,
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            margin: EdgeInsets.all(15),
                                            height: 32,
                                            width: 32,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors
                                                    .red, // Color of the border
                                                width: 1, // Width of the border
                                              ),
                                              borderRadius: BorderRadius.circular(
                                                  50), // Adjust the radius to make it more or less rounded
                                            ),
                                            child: IconButton(
                                              highlightColor: Colors.white,
                                              splashColor: Colors.white,
                                              focusColor: Colors.red,
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.favorite_border_outlined,
                                                size: 15,
                                                color: Colors.red,
                                              ),
                                              // Adjust the padding to make the button larger or smaller
                                              constraints:
                                                  BoxConstraints(), // Apply constraints if needed to adjust the button's size
                                            ),
                                          ),

                                          TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Claim Ownership?',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 8),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : _tabIndex == 1
                        ? Container(
                            width: 400,
                            height: 450,
                            child: EventCalendar(),
                          )
                        : Container(
                            child: Text(
                              'map',
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ),
                          )
              ],
            )),
        // floatingActionButton: Container(
        //   decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
        //     BoxShadow(
        //         color: Color.fromRGBO(19, 22, 40, 1),
        //         spreadRadius: 7,
        //         blurRadius: 1)
        //   ]),
        //   child: FloatingActionButton(
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(45.0))),
        //     backgroundColor: Color.fromRGBO(23, 19, 33, 1),
        //     onPressed: () {},
        //     child: const Icon(
        //       Icons.event,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: EventsBottomNavbar(
          onTabChanged: _onTabChanged,
        ),
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context, title, color) {
  return AppBar(
    toolbarHeight: 70,
    title: Text(title,
        style: TextStyle(
          fontFamily: 'Cairo',
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )),
    backgroundColor: color,
    elevation: 0.5,
    actions: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: color,
        ),
        child: PopupMenuButton<String>(
          onSelected: (String result) {
            print("Selected: $result");
          },
          color: Color.fromRGBO(19, 22, 40, 1),
          elevation: 0,
          offset: Offset(0, 50),
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrganiserPublisher()),
                  );
                },
                value: "submit_event",
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Submit event",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  Navigator.pushNamed(context, '/auth');
                },
                value: "join",
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Join",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle, color: Colors.white),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromRGBO(19, 22, 40, 1),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
        ),
      ),
    ],
    leading: Container(
      margin: EdgeInsets.all(10),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
          size: 30.0,
        ),
        onPressed: () {
          Navigator.popAndPushNamed(context, '/home');
        },
      ),
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
    titleSpacing: 10,
  );
}
