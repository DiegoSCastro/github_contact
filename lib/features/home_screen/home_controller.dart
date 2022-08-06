import 'package:github_contact/repositories/github_api.dart';
import 'package:mobx/mobx.dart';

import '../../models/user.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

enum HomeScreenState {
  loading,
  success,
  error,
}

abstract class _HomeController with Store {
  @observable
  HomeScreenState state = HomeScreenState.success;

  @computed
  bool get isLoading => state == HomeScreenState.loading;

  ObservableList randomUsersList = ObservableList<User>();

  @action
  void getRandomUsersList() {
    state = HomeScreenState.loading;
    GitHubApi().getRandomUsers().then((usersMap) {
      List usersList = usersFromMapArray(usersMap);
      randomUsersList.addAll(usersList);
    }).catchError((e) {
      state = HomeScreenState.error;
    }).whenComplete(() {
      state = HomeScreenState.success;
    });
  }
}
