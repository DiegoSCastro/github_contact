import 'package:flutter/material.dart';
import 'package:github_contact/constants/app_colors.dart';
import 'package:github_contact/constants/app_text_styles.dart';
import 'package:github_contact/models/UserRepository.dart';

class RepositoryListItem extends StatelessWidget {
  final UserRepository userRepository;
  const RepositoryListItem({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.darkGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: AppColors.lightGray,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Text(
                      userRepository.fullName,
                      style: AppTextStyles.bodyTextMedium.copyWith(color: AppColors.primary),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.darkGray),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(userRepository.visibility),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
