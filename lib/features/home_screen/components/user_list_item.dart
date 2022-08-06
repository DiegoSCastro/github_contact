import 'package:flutter/material.dart';

import '../../../models/user.dart';

class UserListItem extends StatelessWidget {
  final User user;
  const UserListItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(user.avatarUrl),
          radius: 60,
        ),
        Expanded(
          child: Column(
            children: [
              Text(user.login),
            ],
          ),
        )
      ],
    );
  }
}
