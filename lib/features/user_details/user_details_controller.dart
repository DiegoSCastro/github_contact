import 'package:github_contact/models/user_details.dart';
import 'package:github_contact/repositories/github_api.dart';
import 'package:mobx/mobx.dart';

part 'user_details_controller.g.dart';

class UserDetailsController = _UserDetailsController with _$UserDetailsController;

enum UserDetailsScreenState {
  loading,
  success,
  error,
}

abstract class _UserDetailsController with Store {
  @observable
  UserDetailsScreenState state = UserDetailsScreenState.loading;

  @computed
  bool get isLoading => state == UserDetailsScreenState.loading;

  @observable
  UserDetails? userDetails;

  @action
  void getUserDetails(String userLogin) {
    state = UserDetailsScreenState.loading;
    GitHubApi().getUserInformation(userLogin).then((userDetailsMap) {
      userDetails = UserDetails.fromMap(userDetailsMap);
      state = UserDetailsScreenState.success;
    }).catchError((e) {
      state = UserDetailsScreenState.error;
    }).whenComplete(() {});
  }
}
