import 'package:untitled35/helpers.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallLogItem extends StatelessWidget {
  const CallLogItem(
      {super.key, required this.currentCallLog, required this.onClickInfo});

  final CallLogEntry currentCallLog;

  final Function() onClickInfo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 24,
        child: Text(
          getAvatorTitle(currentCallLog),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      title: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: currentCallLog.name == null || currentCallLog.name!.isEmpty ? GestureDetector(
            onTap: (){
              onClickInfo;
            },
            child: Text(
              "${currentCallLog.number}",style: Theme.of(context).textTheme.bodyLarge,
            ),
          ):
          GestureDetector(
              onTap: (){
                onClickInfo;
              },
              child: Text("${currentCallLog.name}",style: Theme.of(context).textTheme.bodyLarge,))
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          getCallTypeIcon(currentCallLog.callType!),
          const SizedBox(
            width: 8,
          ),
          Text(
            formatDate(currentCallLog.timestamp!),
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
      trailing: IconButton(
          onPressed: onClickInfo,
          icon: Icon(
            Icons.info_outline_rounded,
            color: Theme.of(context).colorScheme.inversePrimary,
            size: 20,
          )),
    );
  }
}