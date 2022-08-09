import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:github_contact/constants/app_assets.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            LocaleNotifier.of(context)?.change('en');
          },
          icon: Image.asset(AppAssets.enUs),
        ),
        IconButton(
          onPressed: () {
            LocaleNotifier.of(context)?.change('pt');
          },
          icon: Image.asset(AppAssets.ptBr),
        ),
        IconButton(
          onPressed: () {
            LocaleNotifier.of(context)?.change('he');
          },
          icon: Image.asset(AppAssets.heIL),
        ),
      ],
    );
  }
}
