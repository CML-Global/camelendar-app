import 'package:camelendar/pages/auth.dart';
import 'package:camelendar/pages/organiser_publisher.dart';
import 'package:camelendar/pages/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    Key? key,
    required this.title,
    required this.color,
    this.isSignedIn = false,
    this.userName,
    this.userPhotoUrl,
    this.email,
  }) : super(key: key);

  final String title;
  final Color color;
  final bool isSignedIn;
  final String? userName;
  final String? userPhotoUrl;
  final String? email;

  @override
  Size get preferredSize => Size.fromHeight(70); 

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      title: Text(title,
          style: TextStyle(
            fontFamily: 'Cairo',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
      backgroundColor:  Color.fromRGBO(19, 22, 40, 1),
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
                isSignedIn
               ?PopupMenuItem(child: _buildUserProfile(context))
                :PopupMenuItem(child: Container(height: 0,), height: 0,),
                PopupMenuItem(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => isSignedIn ? OrganiserPublisher() : Auth()),
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
                    isSignedIn
                    ? _signOut(context)
                    :Navigator.pushNamed(context, '/auth');
                  },
                  value: isSignedIn ? "Sign out" : "join",
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          isSignedIn ? "Sign out" : "join",
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
                            isSignedIn ? Icons.logout_sharp : Icons.arrow_forward_ios ,
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
      leading: title == 'Camelendar' 
      ? Container(
        padding: EdgeInsets.all(7),
        child: Image.asset('assets/images/logo.png'),
      )
      : IconButton(
        icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
        onPressed: () {
         
          Navigator.of(context).pop();
        },
      ),
      
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      titleSpacing: 0,
    );
  }
    Widget _buildUserProfile(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ProfilePage(
              userName: userName,
              userPhotoUrl: userPhotoUrl,
              email: email,
            ),
          ),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userPhotoUrl!),
          ),
          if (userName != null) Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(userName! ?? 'User', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

void _signOut(BuildContext context) async {
  GoogleSignIn googleSignIn = GoogleSignIn();
  await googleSignIn.signOut();
  Navigator.pushNamed(context ,'/home'); 
   final logOut = await SharedPreferences.getInstance();
   logOut.setBool('isSignedIn',false);
}

