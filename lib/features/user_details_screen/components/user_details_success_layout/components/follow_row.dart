import 'package:flutter/material.dart';
import 'package:github_contact/features/user_repository/user_repository_screen.dart';
import 'package:github_contact/models/user_details.dart';

import 'follow_item.dart';

class FollowRow extends StatelessWidget {
  final UserDetails? userDetails;
  const FollowRow({Key? key, required this.userDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                FollowItem(
                  label: 'Followers',
                  count: userDetails?.followers ?? 0,
                ),
                FollowItem(
                  label: 'Following',
                  count: userDetails?.following ?? 0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserRepositoryScreen(
                        userId: userDetails?.login ?? ' ',
                      ),
                    ),
                  );
                },
                child: FollowItem(
                  label: 'Repositories',
                  count: userDetails?.publicRepos ?? 0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
