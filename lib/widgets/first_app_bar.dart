import 'package:flutter/material.dart';

class FirstAppBar extends StatelessWidget {
  const FirstAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -35,
          right: 35,
          child: CircleAvatar(radius: 40, backgroundColor: Colors.pinkAccent),
        ),
        Positioned(
          top: 75,
          right: 75,
          child: CircleAvatar(radius: 60, backgroundColor: Colors.orangeAccent),
        ),
        Positioned(
          top: 90,
          right: -18,
          child: CircleAvatar(radius: 25, backgroundColor: Colors.lightBlue),
        ),
      ],
    );
  }
}
