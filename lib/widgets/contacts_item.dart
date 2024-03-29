import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:untitled35/screens/call_log_details_screen.dart';
import 'package:untitled35/widgets/call_log_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:call_log/call_log.dart';

import '../helpers.dart';

class ContactsItem extends StatelessWidget {
  const ContactsItem({Key? key, required this.currentContact, required this.currentCallLog});

  final Contact? currentContact;
  final CallLogEntry? currentCallLog;

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
      trailing:PopupMenuButton(
        itemBuilder: (context)=>[
          PopupMenuItem(child: ListTile(
            leading: IconButton(
              onPressed: () {
                if (currentCallLog != "" ) {
                  callNumber(currentCallLog!.number!.toString());
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
            ),)),
          PopupMenuItem(child: ListTile(
            leading: IconButton(
              onPressed: () async {
                final Uri url = Uri(
                  scheme: 'sms',
                  path: "${(currentCallLog!.number!.toString())}",
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
            ),)),
          PopupMenuItem(child: ListTile(
            leading: IconButton(
              onPressed: () {

              },
              icon: const Icon(
                Icons.block,
                color: Colors.green,
              ),
            ),)),
          PopupMenuItem(child: ListTile(
            leading: IconButton(
              onPressed: () {

              },
              icon: const Icon(
                Icons.info_outline_rounded,
                color: Colors.green,
              ),
            ),)),

        ],
        child: Icon(Icons.more_vert,
          color: Colors.grey,),
      ),
    );
  }
}
