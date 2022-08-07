import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_contact/features/user_repository/user_repository_controller.dart';

class UserRepositoryScreen extends StatefulWidget {
  final String userId;
  const UserRepositoryScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<UserRepositoryScreen> createState() => _UserRepositoryScreenState();
}

class _UserRepositoryScreenState extends State<UserRepositoryScreen> {
  late UserRepositoryController controller;

  @override
  void initState() {
    controller = UserRepositoryController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repository'),
      ),
      body: Observer(builder: (_) {
        switch (controller.state) {
          case UserRepositoryScreenState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case UserRepositoryScreenState.success:
            return Column(
              children: [],
            );
          case UserRepositoryScreenState.error:
            return Text('Error');
        }
      }),
    );
  }
}
