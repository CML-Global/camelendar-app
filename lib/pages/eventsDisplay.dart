import 'dart:ui';

import 'package:camelendar/models/event_Model.dart';
import 'package:camelendar/pages/auth.dart';
import 'package:camelendar/pages/organiser_publisher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventDisplay extends StatefulWidget {
  const EventDisplay({Key? key}) : super(key: key);

  @override
  State<EventDisplay> createState() => _EventDisplayState();
}

class _EventDisplayState extends State<EventDisplay> {
  bool _showPastEvents = false;
  @override
  Widget build(BuildContext context) {
    List<EventModel> events = [];
    events.add(EventModel(
      title: 'Item1',
      photo: 'assets/images/event_pic.jpg',
      date: 'jun12 - jul14',
      location: 'location',
    ));
    events.add(EventModel(
      title: 'item2',
      photo: 'assets/images/event_pic2.jpg',
      date: 'jun12 - jul14',
      location: 'location',
    ));
    void _getInitialInfo() {
      events = EventModel.getEvents();
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/hero_img.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildAppBar(context),
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
                          'Show Past\n Events',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        )
                      : Text(
                          'Show Current \n Events',
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      shadowColor: const Color.fromARGB(38, 255, 255, 255),
                      color: Colors.transparent,
                      surfaceTintColor: const Color.fromARGB(61, 0, 0, 0),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.end,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
                                  child: Image(
                                    image: AssetImage(event.photo),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.unlockKeyhole,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            event.title,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.calendar,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            event.date,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 8,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.locationArrow,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: Text(
                                            event.location,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                    const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        FaIcon(
                                          Icons.add_task_rounded,
                                          size: 10,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 250,
                                          child: Expanded(
                                            flex: 3,
                                            child: Text(
                                              'Created by Camelendar Team',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          child: Expanded(
                                            flex: 1,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                'Claim Ownership?',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.red, width: .5),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: IconButton(
                                            constraints: BoxConstraints(
                                              maxHeight: 50,
                                              maxWidth: 50,
                                            ),
                                            onPressed: () {},
                                            icon: FaIcon(
                                              Icons.arrow_right_outlined,
                                              size: 35,
                                              color: Colors.red,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(19, 22, 40, 1),
                spreadRadius: 7,
                blurRadius: 1)
          ]),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(45.0))),
            backgroundColor: Color.fromRGBO(23, 19, 33, 1),
            onPressed: () {},
            child: const Icon(
              Icons.event,
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildBottomNavbar(),
      ),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 70,
    title: Text('Events',
        style: TextStyle(
          fontFamily: 'Cairo',
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        )),
    backgroundColor: Color.fromRGBO(19, 22, 40, 1),
    elevation: 0.5,
    actions: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(19, 22, 40, 1),
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
