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
          radius: 60,
          child: Image.network(user.avatarUrl),
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
