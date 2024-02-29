import 'package:camelendar/main.dart';
import 'package:camelendar/pages/organiser_publisher.dart';
import 'package:camelendar/widgets/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        appBar:
            CustomAppbar(title: 'Event', color: Color.fromRGBO(19, 22, 40, 1)),
        body: buildAuthBody(context),
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
        // bottomNavigationBar: buildBottomNavbar(),
      ),
    );
  }
}

Column buildAuthBody(BuildContext context) {
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
                    onPressed: () {
                      _signInWithGoogle(context);
                    },
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

Future<void> _signInWithGoogle(BuildContext context) async {
  try {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setBool('isSignedIn', true);
      print(sharedPreferences.getBool('isSignedIn'));
      String email = googleUser.email ?? "";
      String displayName = googleUser.displayName ?? "";
      String photoUrl = googleUser.photoUrl ?? "";

      await sharedPreferences.setString('email', email);
      await sharedPreferences.setString('displayName', displayName);
      await sharedPreferences.setString('photoUrl', photoUrl);

      print("Email: $email");
      print("Name: $displayName");
      print("Photo URL: $photoUrl");

      Navigator.pushNamed(context, '/events');
    }
  } catch (error) {
    print(error);
  }
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
