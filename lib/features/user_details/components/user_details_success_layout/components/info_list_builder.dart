import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_contact/models/user_details.dart';

import 'info_item.dart';

class InfoListBuilder extends StatelessWidget {
  final UserDetails? userDetails;
  const InfoListBuilder({Key? key, required this.userDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        InfoItem(
          icon: Icons.email_outlined,
          label: 'Email',
          content: userDetails?.email ?? '',
        ),
        InfoItem(
          icon: Icons.store_mall_directory_outlined,
          label: 'Company',
          content: userDetails?.company ?? '',
        ),
        InfoItem(
          icon: Icons.location_on_outlined,
          label: 'Location',
          content: userDetails?.location ?? '',
        ),
        InfoItem(
          icon: Icons.web_outlined,
          label: 'Website / Blog',
          content: userDetails?.blog ?? '',
        ),
        InfoItem(
          icon: Icons.person,
          label: 'Bio',
          content: userDetails?.bio ?? '',
        ),
        InfoItem(
          icon: FontAwesomeIcons.twitter,
          label: 'Twitter Username',
          content: userDetails?.twitterUsername ?? '',
        ),
      ],
    );
  }
}
