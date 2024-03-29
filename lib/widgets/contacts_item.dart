import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

import '../helpers.dart';

class ContactsItem extends StatelessWidget {
  const ContactsItem({Key? key, required this.currentContact});

  final Contact? currentContact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          (currentContact?.displayName?.trim().length ?? 0) >= 2
              ? currentContact?.displayName?.trim().substring(0, 2) ?? ""
              : currentContact?.displayName?.trim() ?? "",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      title: Text(
        currentContact?.displayName ?? "",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text(
        currentContact?.phones?.isEmpty ?? true
            ? 'No Number'
            : currentContact?.phones?.elementAt(0).value.toString() ??
            'No Number',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: IconButton(
        onPressed: () {
          if (currentContact?.phones?.isNotEmpty ?? false) {
            callNumber(currentContact!.phones!.elementAt(0).value.toString());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('No Number is available to call'),
              ),
            );
          }
        },
        icon: const Icon(
          Icons.call,
          color: Colors.green,
        ),
      ),
    );
  }
}
