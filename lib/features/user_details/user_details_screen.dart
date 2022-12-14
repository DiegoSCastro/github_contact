import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_contact/constants/app_colors.dart';
import 'package:github_contact/constants/app_text_styles.dart';
import 'package:github_contact/features/user_details/user_details_controller.dart';
import 'package:github_contact/routes/app_router.gr.dart';

import 'components/user_details_success_layout/user_details_success_layout.dart';

class UserDetailsScreen extends StatefulWidget {
  final String userId;
  const UserDetailsScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late UserDetailsController controller;

  @override
  void initState() {
    controller = UserDetailsController();
    controller.getUserDetails(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Locales.string(context, 'profile'),
          style: AppTextStyles.appBarWhite,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      floatingActionButton: Observer(builder: (_) {
        if (controller.userDetails != null) {
          return FloatingActionButton.large(
            onPressed: () {
              AutoRouter.of(context).push(
                ContactsRoute(userDetails: controller.userDetails!),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                Locales.string(context, 'compare_with_contacts'),
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyTextMediumWhite,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
      body: Observer(builder: (_) {
        switch (controller.state) {
          case UserDetailsScreenState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case UserDetailsScreenState.error:
            return Center(
              child: Text(
                Locales.string(context, 'error_getting_data'),
                textAlign: TextAlign.center,
                style: AppTextStyles.headLine5White.copyWith(color: Colors.red),
              ),
            );
          case UserDetailsScreenState.success:
            return UserDetailsSuccessLayout(controller: controller);
        }
      }),
    );
  }
}
