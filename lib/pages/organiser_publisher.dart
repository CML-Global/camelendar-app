import 'dart:ui';

import 'package:camelendar/pages/auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrganiserPublisher extends StatelessWidget {
  const OrganiserPublisher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   List<String> submit_profile = ['Organiser', 'Publisher'];
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
          child: ListView.builder(
            itemCount: submit_profile.length,
              itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 12),
                shadowColor: Color.fromARGB(255, 255, 255, 255),
                color: Color.fromARGB(224, 255, 255, 255),
                surfaceTintColor: Color.fromARGB(139, 58, 72, 141),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 10 / 6,
                          child: Container(
                            child: Image(
                                image: AssetImage(
                                    'assets/images/${submit_profile[index]}.jpg')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      submit_profile[index],
                                      style: TextStyle(
                                          fontFamily: 'Cairo',
                                          fontSize: 32,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 12, 4, 43)),
                                    ),
                                  ),
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
    title: Text('Submit Event as a ? ',
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
                onTap: () {},
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
