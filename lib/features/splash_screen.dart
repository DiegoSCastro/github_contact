import 'package:flutter/material.dart';
import 'package:github_contact/constants/app_text_styles.dart';
import 'package:github_contact/features/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then(
      (value) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child: Text(
          'Github\nContacts',
          textAlign: TextAlign.center,
          style: AppTextStyles.headline1White,
        ),
      ),
    );
  }
}
