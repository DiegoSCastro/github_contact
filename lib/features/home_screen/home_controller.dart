import 'package:github_contact/repositories/github_api.dart';
import 'package:mobx/mobx.dart';

import '../../models/user.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

enum HomePageState {
  loading,
  success,
  error,
}

abstract class _HomeController with Store {
  @observable
  HomePageState state = HomePageState.success;

  @computed
  bool get isLoading => state == HomePageState.loading;

  ObservableList randomUsersList = ObservableList<User>();

  @action
  void getRandomUsersList() {
    state = HomePageState.loading;
    GitHubApi().getRandomUsers().then((usersMap) {
      List usersList = usersFromMapArray(usersMap);
      randomUsersList.addAll(usersList);
    }).catchError((e) {
      state = HomePageState.error;
    }).whenComplete(() {
      state = HomePageState.success;
    });
  }
}
