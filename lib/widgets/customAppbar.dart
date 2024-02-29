import 'package:camelendar/pages/organiser_publisher.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key, required this.title, required this.color})
      : super(key: key);
  final String title;
  final Color color;

  @override
  Size get preferredSize => Size.fromHeight(70); // Adjust the height as needed

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
        padding: EdgeInsets.all(7),
        child: Image.asset('assets/images/logo.png'),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      titleSpacing: 0,
    );
 }
}
