import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String userAvatarUrl;
  const UserAvatar({Key? key, required this.userAvatarUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 84,
        child: CircleAvatar(
          radius: 80,
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(userAvatarUrl),
        ),
      ),
    );
  }
}
