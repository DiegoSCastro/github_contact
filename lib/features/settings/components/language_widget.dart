import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:github_contact/constants/app_assets.dart';
import 'package:github_contact/constants/app_colors.dart';
import 'package:github_contact/constants/app_text_styles.dart';

import 'language_item.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            Locales.string(context, 'languages'),
            style: AppTextStyles.headLine5White.copyWith(color: AppColors.darkGray),
          ),
        ),
        LanguageItem(
          onPressed: () {
            LocaleNotifier.of(context)?.change('en');
          },
          assetImage: AppAssets.enUs,
          language: 'English',
        ),
        LanguageItem(
          onPressed: () {
            LocaleNotifier.of(context)?.change('pt');
          },
          assetImage: AppAssets.ptBr,
          language: 'Português',
        ),
        LanguageItem(
          onPressed: () {
            LocaleNotifier.of(context)?.change('he');
          },
          assetImage: AppAssets.heIL,
          language: 'עברית',
        ),
      ],
    );
  }
}
