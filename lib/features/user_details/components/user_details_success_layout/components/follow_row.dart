import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:github_contact/models/user_details.dart';
import 'package:github_contact/routes/app_router.gr.dart';

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
                  label: Locales.string(context, 'followers'),
                  count: userDetails?.followers ?? 0,
                ),
                FollowItem(
                  label: Locales.string(context, 'following'),
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
                  AutoRouter.of(context).push(
                    UserRepositoryRoute(userId: userDetails?.login ?? ' '),
                  );
                },
                child: FollowItem(
                  label: Locales.string(context, 'repositories'),
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
