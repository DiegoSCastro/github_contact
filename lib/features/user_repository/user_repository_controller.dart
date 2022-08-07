import 'package:mobx/mobx.dart';

import '../../repositories/github_api.dart';

part 'user_repository_controller.g.dart';

class UserRepositoryController = _UserRepositoryController with _$UserRepositoryController;

enum UserRepositoryScreenState {
  loading,
  success,
  error,
}

abstract class _UserRepositoryController with Store {
  @observable
  UserRepositoryScreenState state = UserRepositoryScreenState.success;

  @computed
  bool get isLoading => state == UserRepositoryScreenState.loading;

  @action
  void getUserRepositories(String userLogin) {
    state = UserRepositoryScreenState.loading;

    GitHubApi().getUserRepositories(userLogin).then((userDetailsMap) {
      // userDetails = UserDetails.fromMap(userDetailsMap);
    }).catchError((e) {
      state = UserRepositoryScreenState.error;
    }).whenComplete(() {
      state = UserRepositoryScreenState.success;
    });
  }
}
