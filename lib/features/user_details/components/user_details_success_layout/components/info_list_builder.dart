import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
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
          label: Locales.string(context, 'email'),
          content: userDetails?.email ?? '',
        ),
        InfoItem(
          icon: Icons.store_mall_directory_outlined,
          label: Locales.string(context, 'company'),
          content: userDetails?.company ?? '',
        ),
        InfoItem(
          icon: Icons.location_on_outlined,
          label: Locales.string(context, 'location'),
          content: userDetails?.location ?? '',
        ),
        InfoItem(
          icon: Icons.web_outlined,
          label: Locales.string(context, 'site_blog'),
          content: userDetails?.blog ?? '',
        ),
        InfoItem(
          icon: Icons.person,
          label: Locales.string(context, 'bio'),
          content: userDetails?.bio ?? '',
        ),
        InfoItem(
          icon: FontAwesomeIcons.twitter,
          label: Locales.string(context, 'twitter_user'),
          content: userDetails?.twitterUsername ?? '',
        ),
      ],
    );
  }
}
