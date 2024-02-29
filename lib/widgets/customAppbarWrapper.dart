import 'package:camelendar/widgets/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomAppBarWrapper extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;
  final Color color;
  final String?
      userName; 
  final String? userPhotoUrl;
  final String? email;

  const CustomAppBarWrapper({
    Key? key,
    required this.title,
    required this.color,
    this.userName,
    this.userPhotoUrl,
    this.email,
  }) : super(key: key);

  @override
  _CustomAppBarWrapperState createState() => _CustomAppBarWrapperState();

  @override
  Size get preferredSize => Size.fromHeight(70); 
}

class _CustomAppBarWrapperState extends State<CustomAppBarWrapper> {
  late Future<bool> _isSignedInFuture;

  @override
  void initState() {
    super.initState();
    _isSignedInFuture = _getSignInState();
  }

  Future<bool> _getSignInState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isSignedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isSignedInFuture,
      builder: (context, snapshot) {
        final isSignedIn = snapshot.data ?? false;
        return CustomAppbar(
          title: widget.title,
          color: widget.color,
          isSignedIn: isSignedIn,
          userName: widget.userName,
          userPhotoUrl: widget.userPhotoUrl,
          email: widget.email,
        );
      },
    );
  }
}
