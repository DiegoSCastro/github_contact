import 'package:fast_contacts/fast_contacts.dart';
import 'package:github_contact/extensions/string_extensions.dart';
import 'package:mobx/mobx.dart';

part 'contacts_controller.g.dart';

class ContactsController = _ContactsController with _$ContactsController;

enum ContactsScreenState {
  loading,
  success,
  error,
}

abstract class _ContactsController with Store {
  @observable
  ContactsScreenState state = ContactsScreenState.success;

  @computed
  bool get isLoading => state == ContactsScreenState.loading;

  @observable
  String? search;

  ObservableList<Contact> contactsList = ObservableList<Contact>();

  ObservableList<Contact> get filteredList => ObservableList.of(
        search == null
            ? contactsList
            : contactsList.where((e) => e.displayName
                .toLowerCase()
                .withoutDiacriticalMarks
                .contains(search?.toLowerCase().withoutDiacriticalMarks ?? '')),
      );

  @action
  void getAllContacts(List<Contact> contacts) {
    state = ContactsScreenState.loading;
    contactsList.addAll(contacts);
    state = ContactsScreenState.success;
  }

  @action
  void setContact(String contactName) {
    search = contactName.substring(0, 3);
  }
}
