import 'package:flutter/material.dart';
import 'package:github_contact/constants/app_colors.dart';
import 'package:github_contact/constants/app_text_styles.dart';
import 'package:github_contact/features/user_details/components/user_details_success_layout/components/user_avatar.dart';
import 'package:github_contact/features/user_details/user_details_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/follow_row.dart';
import 'components/info_list_builder.dart';

class UserDetailsSuccessLayout extends StatelessWidget {
  final UserDetailsController controller;
  const UserDetailsSuccessLayout({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                UserAvatar(userAvatarUrl: controller.userDetails?.avatarUrl ?? ''),
                Text(
                  controller.userDetails?.name ?? '',
                  style: AppTextStyles.headLine5White,
                ),
                InkWell(
                    onTap: () async {
                      final uri = Uri.parse(controller.userDetails?.htmlUrl ?? '');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                    child: Text(
                      controller.userDetails?.htmlUrl ?? '',
                      style: AppTextStyles.bodyTextMediumWhite,
                    )),
                FollowRow(userDetails: controller.userDetails),
              ],
            ),
          ),
          InfoListBuilder(userDetails: controller.userDetails)
        ],
      ),
    );
  }
}
