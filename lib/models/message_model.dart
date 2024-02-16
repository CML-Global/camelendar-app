class Message {
  final String senderId;
  final String recipientId;
  final String text;
  final DateTime createdAt;

  const Message(
      {required this.senderId,
      required this.recipientId,
      required this.text,
      required this.createdAt});

  static List<Message> messages = [
    Message(
        senderId: '1',
        recipientId: '4',
        text: 'fezfzefzefezfzef',
        createdAt: DateTime(2024, 01, 02, 10, 10, 10)),
    Message(
        senderId: '2',
        recipientId: '3',
        text: 'fezfzefzefazeeaze',
        createdAt: DateTime(2024, 01, 02, 10, 23, 23).add(
          const Duration(seconds: 30)
        )),
    Message(
        senderId: '3',
        recipientId: '2',
        text: ' ae  rzrazrazrefzfzef',
        createdAt: DateTime(2024, 01, 02, 10, 39, 39).add(
          const Duration(seconds: 130)
        )
        ),
    Message(
        senderId: '4',
        recipientId: '1',
        text: 'azeazeaze  aezeazeze',
        createdAt: DateTime(2024, 01, 02, 10, 51, 51).add(
          const Duration(seconds: 230)
        )),
  ];
}
