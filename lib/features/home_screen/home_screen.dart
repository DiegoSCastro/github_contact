import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_contact/features/home_screen/components/user_list_item.dart';
import 'package:github_contact/features/home_screen/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getRandomUsersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        switch (controller.state) {
          case HomePageState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case HomePageState.success:
            return ListView.builder(
                itemCount: controller.randomUsersList.length,
                itemBuilder: (context, index) {
                  final user = controller.randomUsersList[index];
                  debugPrint(user.toString());
                  return UserListItem(user: user);
                });

          case HomePageState.error:
            return const Center(
              child: Text('Error'),
            );
        }
      }),
    );
  }
}
