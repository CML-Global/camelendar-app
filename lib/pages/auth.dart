import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/hero_img.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildAppBar(),
        body: buildAuthBody(),
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

AppBar buildAppBar() {
  return AppBar(
    toolbarHeight: 70,
    title: Text('Camelendar',
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
      padding: EdgeInsets.all(7),
      child: Image.asset('assets/images/logo.png'),
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
    titleSpacing: 0,
  );
}

Column buildAuthBody() {
  return Column(
            mainAxisAlignment: MainAxisAlignment.center,

    children: [
      Container(
        padding: EdgeInsets.all(5),
        height: 80,
        child: Image(
          image: AssetImage('assets/images/camel.png'),
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.05),
                Colors.transparent,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: Color.fromARGB(255, 209, 125, 1),
                    fontFamily: 'Cairo',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Login Into Your Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.google, size: 24),
                        SizedBox(width: 16),
                        Text('Sign in with Google'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.linkedinIn, size: 24),
                        SizedBox(width: 16),
                        Text('Sign in with Linkedin'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFF0077B5),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.facebookF, size: 24),
                        SizedBox(width: 16),
                        Text('Sign in with Facebook'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFF4267B2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.apple, size: 24),
                        SizedBox(width: 16),
                        Text('Sign in with Apple'),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromARGB(255, 51, 58, 72),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Container buildBottomNavbar() {
  return Container(
    color: Color.fromRGBO(30, 0, 20, .3),
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.book,
                  color: Colors.white,
                ),
                onPressed: () {})),
        VerticalDivider(
          thickness: .1,
          color: Colors.white,
        ),
        Expanded(
            child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.clipboardList,
                  color: Colors.white,
                ),
                onPressed: () {})),
        VerticalDivider(
          width: 25,
          thickness: .1,
          color: Colors.white,
        ),
        Expanded(
            child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.mapLocationDot,
                  color: Colors.white,
                ),
                onPressed: () {})),
        VerticalDivider(
          thickness: .1,
          color: Colors.white,
        ),
        Expanded(
            child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.message,
                  color: Colors.white,
                ),
                onPressed: () {}))
      ],
    ),
  );
}
