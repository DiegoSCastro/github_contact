import 'dart:typed_data';

import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:github_contact/constants/app_text_styles.dart';

class ContactItem extends StatefulWidget {
  final Contact contact;
  const ContactItem({Key? key, required this.contact}) : super(key: key);

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  late Future<Uint8List?> _imageFuture;

  @override
  void initState() {
    _imageFuture = FastContacts.getContactImage(widget.contact.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          FutureBuilder<Uint8List?>(
              future: _imageFuture,
              builder: (context, snapshot) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 56,
                    width: 56,
                    color: Theme.of(context).primaryColorLight,
                    child: snapshot.hasData
                        ? Image.memory(snapshot.data!, gaplessPlayback: true)
                        : const Icon(Icons.person),
                  ),
                );
              }),
          const SizedBox(
            width: 16,
          ),
          Text(
            widget.contact.displayName,
            style: AppTextStyles.bodyTextMedium,
          ),
        ],
      ),
    );
  }
}
