import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_contact/constants/app_text_styles.dart';
import 'package:github_contact/features/user_repository/components/user_repository_success_layout/user_repository_success_layout.dart';
import 'package:github_contact/features/user_repository/user_repository_controller.dart';
import 'package:github_contact/widgets/loading_widget.dart';

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
    controller.getUserRepositories(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Locales.string(context, 'repository')),
      ),
      body: Observer(
        builder: (_) {
          switch (controller.state) {
            case UserRepositoryScreenState.loading:
              return const LoadingWidget();
            case UserRepositoryScreenState.success:
              return UserRepositorySuccessLayout(controller: controller);
            case UserRepositoryScreenState.error:
              return Text(Locales.string(context, 'error'));
            case UserRepositoryScreenState.empty:
              return Center(
                child: Text(
                  Locales.string(context, 'no_repository'),
                  style: AppTextStyles.headLine5White.copyWith(color: Colors.red),
                ),
              );
          }
        },
      ),
    );
  }
}
