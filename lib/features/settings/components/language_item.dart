import 'package:flutter/material.dart';
import 'package:github_contact/constants/app_colors.dart';
import 'package:github_contact/constants/app_text_styles.dart';

class LanguageItem extends StatelessWidget {
  final VoidCallback onPressed;
  final String assetImage;
  final String language;
  const LanguageItem({
    Key? key,
    required this.onPressed,
    required this.assetImage,
    required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Image.asset(
              assetImage,
              height: 50,
            ),
          ),
          Text(
            language,
            style: AppTextStyles.headLine5White.copyWith(color: AppColors.darkGray),
          ),
        ],
      ),
    );
  }
}
