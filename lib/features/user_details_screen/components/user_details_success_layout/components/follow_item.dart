import 'package:flutter/material.dart';
import 'package:github_contact/constants/app_text_styles.dart';

class FollowItem extends StatelessWidget {
  final String label;
  final int count;
  const FollowItem({
    Key? key,
    required this.label,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: AppTextStyles.bodyTextMediumWhite,
        ),
        const SizedBox(width: 8),
        Text(
          label.toString(),
          style: AppTextStyles.bodyTextMediumWhite.copyWith(
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
