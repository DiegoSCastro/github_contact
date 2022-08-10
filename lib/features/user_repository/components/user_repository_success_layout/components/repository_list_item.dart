import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_contact/constants/app_colors.dart';
import 'package:github_contact/constants/app_text_styles.dart';
import 'package:github_contact/features/user_repository/components/user_repository_success_layout/components/repository_item.dart';
import 'package:github_contact/models/user_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryListItem extends StatelessWidget {
  final UserRepository userRepository;
  const RepositoryListItem({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.darkGray),
      ),
      child: InkWell(
        onTap: () async {
          final uri = Uri.parse(userRepository.htmlUrl);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
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
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.darkGray),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(userRepository.visibility),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      RepositoryItem(
                        icon: Icons.star_border,
                        label: Locales.string(context, 'stars'),
                        value: userRepository.stargazersCount.toString(),
                      ),
                      RepositoryItem(
                        icon: FontAwesomeIcons.codeFork,
                        label: Locales.string(context, 'forks'),
                        value: userRepository.forks.toString(),
                      ),
                      RepositoryItem(
                        icon: FontAwesomeIcons.eye,
                        label: Locales.string(context, 'watchers'),
                        value: userRepository.watchersCount.toString(),
                      ),
                      RepositoryItem(
                        icon: FontAwesomeIcons.bullseye,
                        label: Locales.string(context, 'issues'),
                        value: userRepository.openIssues.toString(),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (userRepository.language.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '${Locales.string(context, 'main_language')} ${userRepository.language}',
                      ),
                    ),
                  if (userRepository.description.isNotEmpty)
                    Text(
                      userRepository.description,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
