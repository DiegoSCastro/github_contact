import 'package:github_contact/models/user_repository.dart';
import 'package:github_contact/repositories/github_api.dart';
import 'package:mobx/mobx.dart';

part 'user_repository_controller.g.dart';

class UserRepositoryController = _UserRepositoryController with _$UserRepositoryController;

enum UserRepositoryScreenState {
  loading,
  success,
  empty,
  error,
}

abstract class _UserRepositoryController with Store {
  @observable
  UserRepositoryScreenState state = UserRepositoryScreenState.success;

  @computed
  bool get isLoading => state == UserRepositoryScreenState.loading;

  ObservableList repositoriesList = ObservableList<UserRepository>();

  @action
  void getUserRepositories(String userLogin) {
    state = UserRepositoryScreenState.loading;
    GitHubApi().getUserRepositories(userLogin).then((userRepositoriesMap) {
      List userRepositoriesList = userRepositoriesFromMapArray(userRepositoriesMap);
      if (userRepositoriesList.isNotEmpty) {
        repositoriesList.addAll(userRepositoriesList);
        state = UserRepositoryScreenState.success;
      } else {
        state = UserRepositoryScreenState.empty;
      }
    }).catchError((e) {
      state = UserRepositoryScreenState.error;
    }).whenComplete(() {});
  }
}
