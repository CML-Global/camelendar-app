import 'package:camelendar/models/chat_model.dart';
import 'package:camelendar/models/message_model.dart';
import 'package:camelendar/models/user_model.dart';
import 'package:camelendar/widgets/custom_Container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagingPage extends StatefulWidget {
  const MessagingPage({super.key});

  @override
  State<MessagingPage> createState() => _MessagingPageState();
}

class _MessagingPageState extends State<MessagingPage> {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  late User user;
  late Chat chat;
  late String text;
  @override
  void initState() {
    user = Get.arguments[0];
    chat = Get.arguments[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 112, 10, 130),
                Color.fromARGB(255, 138, 8, 51)
              ]),
          // image: DecorationImage(
          //   image: AssetImage('assets/images/hero_img.png'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _CustomAppbar(
            user: user,
          ),
          body: customContainer(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                _chatMessages(chat: chat),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: textEditingController,
                  onChanged: (value) {
                    setState(() {
                      text = value;
                      print(text);
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      filled: true,
                      counterStyle: TextStyle(color: Colors.white),
                      fillColor: Color.fromARGB(92, 245, 193, 255),
                      hintText: 'Type Here ....',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(59, 255, 255, 255),
                          fontSize: 12),
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.all(20),
                      suffixIcon: IconButton(
                        onPressed: () {
                          Message message = Message(
                              senderId: '1',
                              recipientId: user.id,
                              text: text,
                              createdAt: DateTime.now());
                          List<Message> messages = List.from(chat.messages)
                            ..add(message);
                          messages.sort(
                              (a, b) => b.createdAt.compareTo(a.createdAt));
                          setState(() {
                            chat = chat.copyWith(messages: messages);
                          });
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}

class _chatMessages extends StatelessWidget {
  const _chatMessages({
    super.key,
    required this.chat,
  });

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          reverse: true,
          itemCount: chat.messages.length,
          itemBuilder: (context, index) {
            Message message = chat.messages[index];
            return Align(
              alignment: (message.senderId == '1')
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.width * 0.66),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: (message.senderId == '1')
                        ? Color.fromARGB(255, 173, 25, 74)
                        : Color.fromARGB(255, 147, 22, 169)),
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  message.text,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            );
          }),
    );
  }
}

class _CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppbar({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Center(
        child: Column(
          children: [
            Text(
              '${user.name} ${user.userName}',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Online',
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
      ),
      elevation: 0,
      actions: [
        Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(user.imageUrl),
            ))
      ],
      leading: Container(
        margin: EdgeInsets.all(10),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/chat');
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

// class dflk extends StatelessWidget with PreferredSizeWidget {
//   const dflk({
//     Key? key,
//     required this.user,
//   }) : super(key: key);
//   final User user;
//   @override
//   Widget build(BuildContext context) {
//     return Appbar(
//       title: Column(
//         children: [Text('${user.name} ${user.userName}')],
//       )
//     );
//   }

//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => throw UnimplementedError();
// }
