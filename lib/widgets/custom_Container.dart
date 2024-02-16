import 'package:flutter/material.dart';

class customContainer extends StatelessWidget {
  const customContainer({super.key, required this.height, required this.child});

  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          // color: Theme.of(context).colorScheme.background.withOpacity(0.8),
          color: Color.fromARGB(127, 36, 0, 40)),
      child: child,
    );
  }
}
