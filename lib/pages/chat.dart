import 'package:camelendar/config/theme.dart';
import 'package:camelendar/models/chat_model.dart';
import 'package:camelendar/models/message_model.dart';
import 'package:camelendar/models/user_model.dart';
import 'package:camelendar/pages/chatScreen.dart';
import 'package:camelendar/pages/eventsDisplay.dart';
import 'package:camelendar/pages/home.dart';
import 'package:camelendar/widgets/customAppbar.dart';
import 'package:camelendar/widgets/custom_Container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<User> users = User.users;
    List<Chat> chats = Chat.chats;
    return Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/images/hero_img.png'),
          //   fit: BoxFit.cover,
          // ),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                const Color.fromARGB(255, 112, 10, 130),
                const Color.fromARGB(255, 138, 8, 51)
              ]),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppbar(
              title: 'Event', color: Color.fromRGBO(19, 22, 40, 1)),
          body: Column(
            children: [
              chatContact(height: height, users: users),
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    chatMessages(height: height, chats: chats),
                    _CustomBottomNavbar(width: width),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class _CustomBottomNavbar extends StatelessWidget {
  const _CustomBottomNavbar({
    Key? key,
    required this.width,
  }) : super(key: key);
  final width;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 65,
        width: width * 0.5,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(255, 194, 41, 105)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message_rounded,
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Material(
              color: Colors.transparent,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person_add_rounded,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class chatMessages extends StatelessWidget {
  const chatMessages({
    super.key,
    required this.height,
    required this.chats,
  });

  final double height;
  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return customContainer(
        height: height,
        child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              // get the other user profile
              User user =
                  chats[index].users!.where((user) => user.id != '1').first;
              // sort the messages based on the creation time
              chats[index]
                  .messages
                  .sort((a, b) => b.createdAt.compareTo(a.createdAt));
              // get the last msg for the chat preview
              Message lastMessage = chats[index].messages.first;
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/message',
                      arguments: [user, chats[index]]);
                },
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(user.imageUrl),
                ),
                title: Text(
                  '${user.name} ${user.userName}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 14,color: Colors.white),
                ),
                subtitle: Text(
                  lastMessage.text,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w200
                  )
                  
                ),
                trailing: Text(
                  ' ${lastMessage.createdAt.hour} : ${lastMessage.createdAt.minute} ',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }));
  }
}

class chatContact extends StatelessWidget {
  const chatContact({
    super.key,
    required this.height,
    required this.users,
  });

  final double height;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      height: height * 0.125,
      margin: EdgeInsets.only(left: 20, top: 20),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (context, index) {
            User user = users[index];
            return Container(
              margin: EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 31,
                    backgroundImage: AssetImage(user.imageUrl),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
