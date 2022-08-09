import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_contact/features/home_screen/components/user_list_item.dart';
import 'package:github_contact/features/home_screen/home_controller.dart';
import 'package:github_contact/routes/app_router.gr.dart';
import 'package:github_contact/widgets/loading_widget.dart';
import 'package:github_contact/widgets/search_dialog.dart';

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

  openSearch() async {
    final search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(currentSearch: ''),
    );
    if (search != null) {
      // ignore: use_build_context_synchronously
      AutoRouter.of(context).push(UserDetailsRoute(userId: search));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Github Contact'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              AutoRouter.of(context).push(const SettingsRoute());
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              openSearch();
            },
          ),
        ],
      ),
      body: Observer(builder: (_) {
        switch (controller.state) {
          case HomeScreenState.loading:
            return const LoadingWidget();
          case HomeScreenState.success:
            return ListView.separated(
              itemCount: controller.randomUsersList.length,
              itemBuilder: (context, index) {
                final user = controller.randomUsersList[index];
                return UserListItem(user: user);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );

          case HomeScreenState.error:
            return const Center(
              child: Text('Error'),
            );
        }
      }),
    );
  }
}
