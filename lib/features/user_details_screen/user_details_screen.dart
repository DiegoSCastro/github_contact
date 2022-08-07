import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_contact/constants/app_colors.dart';
import 'package:github_contact/constants/app_text_styles.dart';
import 'package:github_contact/features/user_details_screen/components/user_details_success_layout/user_details_success_layout.dart';
import 'package:github_contact/features/user_details_screen/user_details_controller.dart';

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
        title: const Text(
          'Profile',
          style: AppTextStyles.appBarWhite,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Compare with Contacts',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Observer(builder: (_) {
        switch (controller.state) {
          case UserDetailsScreenState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case UserDetailsScreenState.error:
            return const Text(
              'ERROR',
              style: TextStyle(color: Colors.red),
            );
          case UserDetailsScreenState.success:
            return UserDetailsSuccessLayout(controller: controller);
        }
      }),
    );
  }
}
