import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(6, 12, 45, 1),
                  Color.fromRGBO(45, 13, 28, 1)
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 34),
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_left,
                        size: 16,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.logout,
                        size: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'My\nProfile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: height * height,
                    color: Colors.black,
                    child: LayoutBuilder(builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;
                      return Stack(fit: StackFit.expand, children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: innerHeight * 0.65,
                            width: innerWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                           bottom: 0,
                            left: 0,
                            
                            right: 0,
                            child: Container(
                                width: 30,
                                child: Image.asset(
                                  'assets/images/camel.png',
                                  fit: BoxFit.fitWidth,
                                )))
                      ]);
                    }),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
