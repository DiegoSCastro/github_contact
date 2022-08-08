// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactsController on _ContactsController, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_ContactsController.isLoading'))
          .value;

  late final _$stateAtom =
      Atom(name: '_ContactsController.state', context: context);

  @override
  ContactsScreenState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ContactsScreenState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$searchAtom =
      Atom(name: '_ContactsController.search', context: context);

  @override
  String? get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String? value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$_ContactsControllerActionController =
      ActionController(name: '_ContactsController', context: context);

  @override
  void getAllContacts(List<Contact> contacts) {
    final _$actionInfo = _$_ContactsControllerActionController.startAction(
        name: '_ContactsController.getAllContacts');
    try {
      return super.getAllContacts(contacts);
    } finally {
      _$_ContactsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContact(String contactName) {
    final _$actionInfo = _$_ContactsControllerActionController.startAction(
        name: '_ContactsController.setContact');
    try {
      return super.setContact(contactName);
    } finally {
      _$_ContactsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
search: ${search},
isLoading: ${isLoading}
    ''';
  }
}
