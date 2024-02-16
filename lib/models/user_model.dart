class User {
  final String id;
  final String name;
  final String userName;
  final String imageUrl;

  const User(
      {required this.id,
      required this.name,
      required this.userName,
      required this.imageUrl});

  static const List<User> users = [
    User(
        id: '1',
        name: 'Anwar',
        userName: 'Elaajabi',
        imageUrl:
            'assets/images/chat-users/user0.jpeg'),
    User(
        id: '2',
        name: 'Abderahim',
        userName: 'Haijoub',
        imageUrl:
            'assets/images/chat-users/user2.jpeg'),
    User(
        id: '3',
        name: 'Chi7d',
        userName: 'wKnyto',
        imageUrl:
            'assets/images/chat-users/user3.jpeg'),
    User(
        id: '4',
        name: 'Anass',
        userName: 'Khali',
        imageUrl:
            'assets/images/chat-users/user4.jpeg'),
    User(
        id: '5',
        name: 'Youness',
        userName: 'Fikri',
        imageUrl:
            'assets/images/chat-users/user5.jpeg'),
    User(
        id:'6',
        name: 'Tupac',
        userName: 'Shakur',
        imageUrl:
            'assets/images/chat-users/user6.jpeg'),
    User(
        id: '7',
        name: 'Biggie',
        userName: 'Smalls',
        imageUrl:
            'assets/images/chat-users/user7.jpeg'),
    User(
        id: '8',
        name: 'Ahmed',
        userName: 'Rodani',
        imageUrl:
            'assets/images/chat-users/user8.jpeg'),
  ];
}

/*
    User(
        id: '1',
        name: 'Anwar',
        userName: 'Anwar01',
        imageUrl:
            'assets/images/chat-users/user1.jpeg'),
    User(
        id: '2',
        name: 'Said',
        userName: 'Said01',
        imageUrl:
            'assets/images/chat-users/user2.jpeg'),
    User(
        id: '3',
        name: 'Ali',
        userName: 'Ali01',
        imageUrl:
            'assets/images/chat-users/user3.jpeg'),
    User(
        id: '4',
        name: 'Ahmed',
        userName: 'Ahmed01',
        imageUrl:
            'assets/images/chat-users/user4.jpeg'),
    User(
        id: '5',
        name: 'Anwar',
        userName: 'Anwar01',
        imageUrl:
            'assets/images/chat-users/user5.jpeg'),
    User(
        id:'6',
        name: 'Said',
        userName: 'Said01',
        imageUrl:
            'assets/images/chat-users/user6.jpeg'),
    User(
        id: '7',
        name: 'Ali',
        userName: 'Ali01',
        imageUrl:
            'assets/images/chat-users/user7.jpeg'),
    User(
        id: '8',
        name: 'Ahmed',
        userName: 'Ahmed01',
        imageUrl:
            'assets/images/chat-users/user8.jpeg'),
  ];
*/