import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:github_contact/constants/app_colors.dart';
import 'package:github_contact/routes/app_router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(
    ['en', 'pt', 'he'],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Github Contact',
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.white),
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColors.primary,
          ),
          brightness: Brightness.light,
        ),
        // home: const SplashScreen(),
      ),
    );
  }
}
