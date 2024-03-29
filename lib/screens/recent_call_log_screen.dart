import 'package:untitled35/screens/call_log_details_screen.dart';
import 'package:untitled35/widgets/call_log_item.dart';
import 'package:flutter/material.dart';
import 'package:untitled35/helpers.dart';
import 'package:call_log/call_log.dart';

class RecentsCallLogScreen extends StatefulWidget {
  const RecentsCallLogScreen({super.key});
  @override
  State<RecentsCallLogScreen> createState() => _RecentsCallLogScreenState();
}

class _RecentsCallLogScreenState extends State<RecentsCallLogScreen>
    with WidgetsBindingObserver {
  late Future<Iterable<CallLogEntry>> allCallLogs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    allCallLogs = getAllCallLogs();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      setState(() {
        allCallLogs = getAllCallLogs();
      });
    }
  }

  void _onClickInfo(BuildContext context, CallLogEntry callLog) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => CallLogDetailsScreen(callLog: callLog),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recents'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: FutureBuilder(
          future: allCallLogs,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<CallLogEntry> entries = snapshot.data!.toList();

              return ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) => CallLogItem(
                    currentCallLog: entries.elementAt(index),
                    onClickInfo: () {
                      _onClickInfo(context, entries.elementAt(index));
                    }),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
