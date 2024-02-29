import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isBactrianSelected = false;
  bool _isLamaSelected = false;
  bool _isCamelSelected = false;
  bool _isAlpacaSelected = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(6, 12, 45, 1),
                Color.fromRGBO(45, 13, 28, 1)
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 38),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_left_sharp,
                        size: 24,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.logout,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'My Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: height * 0.4,
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
                              border: Border.all(color: Colors.white, width: 1),
                              color: Colors.transparent,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 35,
                                ),
                                Text(
                                  '@Anwar_036',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Veterinary',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    buildAnimalIcon(
                                        'assets/images/icons/bactrian.png',
                                        _isBactrianSelected, () {
                                      setState(() {
                                        _isBactrianSelected =
                                            !_isBactrianSelected;
                                      });
                                    }, 'Bactrian'),
                                    SizedBox(width: 20),
                                    buildAnimalIcon(
                                        'assets/images/icons/lama.png',
                                        _isLamaSelected, () {
                                      setState(() {
                                        _isLamaSelected = !_isLamaSelected;
                                      });
                                    }, 'Lama'),
                                    SizedBox(width: 20),
                                    buildAnimalIcon(
                                        'assets/images/icons/camel.png',
                                        _isCamelSelected, () {
                                      setState(() {
                                        _isCamelSelected = !_isCamelSelected;
                                      });
                                    }, 'Camel'),
                                    SizedBox(width: 20),
                                    buildAnimalIcon(
                                        'assets/images/icons/albaca.png',
                                        _isAlpacaSelected, () {
                                      setState(() {
                                        _isAlpacaSelected = !_isAlpacaSelected;
                                      });
                                    }, 'Albaca'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              child: Image.asset(
                                'assets/images/camel.png',
                                width: innerWidth * 0.15,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ]);
                    }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white, width: 1),
                        color: Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Text(
                            'My Infos ',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                         
                          Container(
                            height: height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                buildSocialIcon(
                                  FontAwesomeIcons.facebookF,
                                  () => print('Facebook clicked'),
                                ),
                                SizedBox(width: 32),
                                buildSocialIcon(
                                  FontAwesomeIcons.instagram,
                                  () => print('Instagram clicked'),
                                ),
                                SizedBox(width: 32),
                                buildSocialIcon(
                                  FontAwesomeIcons.xTwitter,
                                  () => print('Twitter clicked'),
                                ),
                                SizedBox(width: 32),
                                buildSocialIcon(
                                  FontAwesomeIcons.linkedinIn,
                                  () => print('LinkedIn clicked'),
                                ),
                              ],
                            ),
                          ),
                         
                          Text(
                            'My Photos ',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Divider(
                            thickness: 0.5,
                          ),
                           SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(38)),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildAnimalIcon(String imagePath, bool isSelected, VoidCallback onTap,
      String animalName) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Opacity(
            opacity: isSelected ? 0.4 : 1.0,
            child: Image.asset(
              imagePath,
              width: 24,
              height: 24,
            ),
          ),
          Text(
            animalName, // You can replace this with the actual animal label
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildSocialIcon(IconData iconData, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Icon(
      iconData,
      size: 24,
      color: Colors.white,
    ),
  );
}
