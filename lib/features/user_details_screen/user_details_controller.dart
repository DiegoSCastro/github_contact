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
  UserDetailsScreenState state = UserDetailsScreenState.success;

  @computed
  bool get isLoading => state == UserDetailsScreenState.loading;
}
