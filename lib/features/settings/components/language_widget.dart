import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:github_contact/constants/app_assets.dart';

import 'language_item.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
