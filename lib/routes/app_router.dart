import 'package:auto_route/auto_route.dart';
import 'package:github_contact/features/contacts_screen/contacts_screen.dart';
import 'package:github_contact/features/home_screen/home_screen.dart';
import 'package:github_contact/features/splash_screen.dart';
import 'package:github_contact/features/user_details_screen/user_details_screen.dart';
import 'package:github_contact/features/user_repository/user_repository_screen.dart';

@MaterialAutoRouter(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: HomeScreen, path: '/home'),
    MaterialRoute(page: UserDetailsScreen, path: '/user-details'),
    MaterialRoute(page: UserRepositoryScreen, path: '/user-repository'),
    MaterialRoute(page: ContactsScreen, path: '/contacts'),
  ],
  replaceInRouteName: 'Screen,Route',
)
class $AppRouter {}
