import 'package:flutter/material.dart';
import 'package:github_contact/constants/app_text_styles.dart';
import 'package:github_contact/features/user_details_screen/user_details_screen.dart';

import '../../../models/user.dart';

class UserListItem extends StatelessWidget {
  final User user;
  const UserListItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UserDetailsScreen(userId: user.login),
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.avatarUrl),
              radius: 25,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '/${user.login}',
                      style: AppTextStyles.bodyTextMedium,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
