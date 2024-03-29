import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:url_launcher/url_launcher.dart';

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
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
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
          IconButton(
            onPressed: () async {
              final Uri url = Uri(
                scheme: 'sms',
                path: "${currentContact?.phones?.elementAt(0).value.toString()}",
              );
              if (await canLaunchUrl(url)){
                await launchUrl(url);
              }else{
                print('cannot launch');
              }
            },
            icon: const Icon(
              Icons.message,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: () {

            },
            icon: const Icon(
              Icons.block,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
