import 'package:flutter/material.dart';

class UserAvatarLetterWidget extends StatelessWidget {
  final String username;

  const UserAvatarLetterWidget({
    super.key,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    String firstLetter = username.isNotEmpty ? username[0].toUpperCase() : '';

    return CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 30,
      child: Text(
        firstLetter,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
