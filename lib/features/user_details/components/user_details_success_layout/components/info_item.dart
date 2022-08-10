import 'package:flutter/material.dart';
import 'package:github_contact/constants/app_colors.dart';
import 'package:github_contact/constants/app_text_styles.dart';

class InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String content;
  const InfoItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (content.isEmpty) {
      return Container();
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.darkGray,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: AppTextStyles.bodyTextMedium.copyWith(color: AppColors.darkGray),
                      ),
                      Text(
                        content,
                        style: AppTextStyles.bodyTextMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      );
    }
  }
}
