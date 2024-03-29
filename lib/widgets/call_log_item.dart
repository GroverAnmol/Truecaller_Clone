import 'package:untitled35/helpers.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:untitled35/screens/call_log_details_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CallLogItem extends StatelessWidget {
  const CallLogItem(
      {super.key, required this.currentCallLog, required this.onClickInfo});

  final CallLogEntry? currentCallLog;

  final Function() onClickInfo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        child: Text(
          getAvatorTitle(currentCallLog!),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      title: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: (currentCallLog!.name == null || currentCallLog!.name!.isEmpty) ? GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return CallLogDetailsScreen(callLog: currentCallLog!);
              }));
            },
            child: Text(
              "${currentCallLog!.number}",
            ),
          ):
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return CallLogDetailsScreen(callLog: currentCallLog!);
                }));
              },
              child: Text("${currentCallLog!.name}",style: Theme.of(context).textTheme.bodyLarge,))
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          getCallTypeIcon(currentCallLog!.callType!),
          const SizedBox(
            width: 3,
          ),
          Text(
            formatDate(currentCallLog!.timestamp!),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11
            ),
          )
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
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
          ),
          IconButton(
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