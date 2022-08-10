import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:github_contact/features/settings/components/language_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Locales.string(context, 'settings')),
      ),
      body: Column(
        children: const [
          LanguageWidget(),
        ],
      ),
    );
  }
}
