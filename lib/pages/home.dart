import 'package:camelendar/pages/auth.dart';
import 'package:camelendar/pages/eventsDisplay.dart';
import 'package:camelendar/pages/organiser_publisher.dart';
import 'package:camelendar/widgets/customAppbar.dart';
import 'package:camelendar/widgets/customAppbarWrapper.dart';
import 'package:camelendar/widgets/homeBottomNavbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSignedIn = false;
  int selectedIndex = 0;
  late Future<bool> isSignedInFuture;
  String? _userName;
  String? _userPhotoUrl;
  @override
  void initState() {
    super.initState();
    isSignedInFuture = _getSignInState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('displayName');
      _userPhotoUrl = prefs.getString('photoUrl');
     
        print("photo link :"+ _userPhotoUrl! + "user Name  :" + _userName!);
   
    });
  }

  Future<bool> _getSignInState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isSignedIn') ?? false;
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
        appBar: CustomAppBarWrapper(
          title: 'Camelendar',
          color: Color.fromRGBO(19, 22, 40, 1),
          userName: _userName,
          userPhotoUrl: _userPhotoUrl,
        ),
        body: buildHeroImage(context),

        // -------------------------------Footer--------------------------------
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
            onPressed: () {
              _isSignedIn 
              ? Navigator.pushNamed(context, '/org_pub')
              : Navigator.pushNamed(context, '/auth');
            },
            child: const Icon(
              Icons.event,
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: HomeBottomNavbar(),
      ),
    );
  }
}

Column buildHeroImage(BuildContext context) {
  return Column(
    children: [
      Container(
        height: 320,
        child: Image(
          image: AssetImage('assets/images/home_img.png'),
        ),
      ),
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
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
                  'Discover and register for the world \nof camelids in 2024 with Camelendar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventDisplay()),
                    );
                  },
                  child: Text('Explore Events'),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
