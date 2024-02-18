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
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  bool _showPastEvents = false;
  int footerIndex = 0;
  int _tabIndex = 0;
  List<Event> eventList = [];
  List<String> _eventAccess = [];
  List<String> _eventType = [];
  List<String> _eventTheme = [];
  List<String> _eventAudience = [];
  String? _selectedAccessMode;
  String? _selectedEventType;
  String? _selectedTheme;
  String? _selectedAudience;

  void _onTabChanged(int index) {
    setState(() {
      _tabIndex = index;
      print(_tabIndex);
    });
  }

// void _extractEventTypes() {
//     _eventAccess = eventList.map((event) => event.type);
//   }
  @override
  void initState() {
    super.initState();
    fetchEventData();
  }

  void fetchEventData() async {
    try {
      final url =
          Uri.parse('https://camelworldmap.com/api/events?target=public');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          final List<dynamic> jsonData = jsonDecode(response.body);
          eventList =
              jsonData.map<Event>((json) => Event.fromJson(json)).toList();
          _eventAccess = eventList
              .map((event) => event.mode)
              .whereType<String>()
              .toSet()
              .toList();
          _eventType = eventList
              .map((event) => event.type)
              .whereType<String>()
              .toSet()
              .toList();
          _eventTheme = eventList
              .map((event) => event.theme)
              .whereType<String>()
              .toSet()
              .toList();
          _eventAudience = eventList
              .map((event) => event.target)
              .whereType<String>()
              .toSet()
              .toList();
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

  List<Event> get filteredEvents {
    var filtered = eventList;

    // search filter
    final query = searchController.text.toLowerCase();
    if (query.isNotEmpty) {
      filtered = filtered.where((event) {
        return event.title.toLowerCase().contains(query);
      }).toList();
    }
    // other filters
    if (_selectedAccessMode != null && _selectedAccessMode!.isNotEmpty) {
      filtered =
          filtered.where((event) => event.mode == _selectedAccessMode).toList();
    }

    if (_selectedEventType != null && _selectedEventType!.isNotEmpty) {
      filtered =
          filtered.where((event) => event.type == _selectedEventType).toList();
    }

    if (_selectedTheme != null && _selectedTheme!.isNotEmpty) {
      filtered =
          filtered.where((event) => event.theme == _selectedTheme).toList();
    }

    if (_selectedAudience != null && _selectedAudience!.isNotEmpty) {
      filtered =
          filtered.where((event) => event.target == _selectedAudience).toList();
    }

    return filtered;
  }

  void _removeFilters() {
    setState(() {
      _selectedAccessMode = null;
      _selectedEventType = null;
      _selectedTheme = null;
      _selectedAudience = null;

      searchController.clear();

      _showPastEvents = false;
    });
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
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: searchController,
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
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.filter_alt_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'FIlters :',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            _removeFilters();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.filter_alt_off_outlined,
                                color: Colors.red,
                                size: 12,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              const Text(
                                'Remove Filters',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownButton<String>(
                      value: _eventAccess.contains(_selectedAccessMode)
                          ? _selectedAccessMode
                          : null,
                      hint: Text('Event Mode',
                          style: TextStyle(color: Colors.white)),
                      dropdownColor: Colors.black,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedAccessMode = newValue;
                        });
                      },
                      items: _eventAccess
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    DropdownButton<String>(
                      value: _eventType.contains(_selectedEventType)
                          ? _selectedEventType
                          : null,
                      hint: Text('Event Type',
                          style: TextStyle(color: Colors.white)),
                      dropdownColor: Colors.black,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedEventType = newValue;
                        });
                      },
                      items: _eventType
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _eventTheme.contains(_selectedTheme)
                            ? _selectedTheme
                            : null,
                        hint: Text('Event Theme',
                            style: TextStyle(color: Colors.white)),
                        dropdownColor: Colors.black,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedTheme = newValue;
                          });
                        },
                        items: _eventTheme
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    DropdownButton<String>(
                      value: _eventAudience.contains(_selectedAudience)
                          ? _selectedAudience
                          : null,
                      hint: Text('Event Audience',
                          style: TextStyle(color: Colors.white)),
                      dropdownColor: Colors.black,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedAudience = newValue;
                        });
                      },
                      items: _eventAudience
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                _tabIndex == 0
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: filteredEvents.length,
                          itemBuilder: (context, index) {
                            final event = filteredEvents[index];
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
                                    children: [
                                      // Logo as a circle
                                      ClipOval(
                                        child: Image.network(
                                          "https://camelworldmap.com/uploads/logos/${event.logo}",
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
                                                event.title,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.calendar,
                                                    color: Colors.white,
                                                    size: 8,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    "Date: ${formatDateString(event.dateStart.toString())}",
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
                                                    FontAwesomeIcons
                                                        .locationPin,
                                                    color: Colors.white,
                                                    size: 8,
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Text(
                                                    event.location,
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
                                      //
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
                                                color: Colors.red,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
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
                                              constraints: BoxConstraints(),
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
