import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_contact/features/contacts_screen/components/contact_item.dart';
import 'package:github_contact/features/contacts_screen/contacts_controller.dart';
import 'package:github_contact/models/user_details.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widgets/loading_widget.dart';

class ContactsScreen extends StatefulWidget {
  final UserDetails userDetails;
  const ContactsScreen({Key? key, required this.userDetails}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  late ContactsController controller;
  late bool _emptyName;

  @override
  void initState() {
    controller = ContactsController();
    getContacts();
    _emptyName = widget.userDetails.name.isEmpty;
    super.initState();
  }

  ///Mobx wont work well with this function: FastContacts.allContacts
  Future<void> getContacts() async {
    bool isGranted = await Permission.contacts.status.isGranted;
    if (!isGranted) {
      isGranted = await Permission.contacts.request().isGranted;
    }
    if (isGranted) {
      final contacts = await FastContacts.allContacts;
      controller.getAllContacts(contacts);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_emptyName ? widget.userDetails.login : widget.userDetails.name),
        bottom: PreferredSize(
          preferredSize: const Size(0, 90),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _emptyName
                        ? controller.setContact(widget.userDetails.login)
                        : controller.setContact(widget.userDetails.name);
                  },
                  child: const Text('Search Contact'),
                ),
                const SizedBox(height: 8),
                Observer(builder: (_) {
                  return Text(controller.search != null
                      ? 'Similar names in your phone contacts list:'
                      : '');
                })
              ],
            ),
          ),
        ),
      ),
      body: Observer(builder: (_) {
        switch (controller.state) {
          case ContactsScreenState.loading:
            return const LoadingWidget();

          case ContactsScreenState.success:
            return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.filteredList.length,
                itemBuilder: (context, index) {
                  final contact = controller.filteredList[index];
                  return ContactItem(contact: contact);
                });

          case ContactsScreenState.error:
            return const Center(
              child: Text('Error getting contacts'),
            );
        }
      }),
    );
  }
}
