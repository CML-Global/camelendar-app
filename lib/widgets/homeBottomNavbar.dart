import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeBottomNavbar extends StatelessWidget {
  const HomeBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(30, 0, 20, .3),
      height: 50,
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
                    FontAwesomeIcons.message,
                    color: Colors.white,
                  ),
                  onPressed: () {}))
        ],
      ),
    );
  }
}