import 'package:flutter/material.dart';
import 'package:github_contact/features/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Contact',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.indigo,
      ),
      home: const SplashScreen(),
    );
  }
}
