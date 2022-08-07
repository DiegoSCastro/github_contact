import 'package:flutter/material.dart';
import 'package:github_contact/features/user_repository/user_repository_controller.dart';
import 'package:github_contact/models/UserRepository.dart';

import 'components/repository_list_item.dart';

class UserRepositorySuccessLayout extends StatelessWidget {
  final UserRepositoryController controller;
  const UserRepositorySuccessLayout({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.repositoriesList.length,
        itemBuilder: (context, index) {
          final UserRepository userRepository = controller.repositoriesList[index];
          return RepositoryListItem(
            userRepository: userRepository,
          );
        });
  }
}
