// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserDetailsController on _UserDetailsController, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_UserDetailsController.isLoading'))
          .value;

  late final _$stateAtom =
      Atom(name: '_UserDetailsController.state', context: context);

  @override
  UserDetailsScreenState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(UserDetailsScreenState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$userDetailsAtom =
      Atom(name: '_UserDetailsController.userDetails', context: context);

  @override
  UserDetails? get userDetails {
    _$userDetailsAtom.reportRead();
    return super.userDetails;
  }

  @override
  set userDetails(UserDetails? value) {
    _$userDetailsAtom.reportWrite(value, super.userDetails, () {
      super.userDetails = value;
    });
  }

  late final _$_UserDetailsControllerActionController =
      ActionController(name: '_UserDetailsController', context: context);

  @override
  void getUserDetails(String userLogin) {
    final _$actionInfo = _$_UserDetailsControllerActionController.startAction(
        name: '_UserDetailsController.getUserDetails');
    try {
      return super.getUserDetails(userLogin);
    } finally {
      _$_UserDetailsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
userDetails: ${userDetails},
isLoading: ${isLoading}
    ''';
  }
}
