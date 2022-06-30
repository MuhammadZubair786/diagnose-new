import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';
import 'package:flutter/services.dart';
import 'package:workmanager/workmanager.dart';
import 'package:localstorage/localstorage.dart';

class CallLOGMB extends StatefulWidget {
  const CallLOGMB({Key? key}) : super(key: key);

  @override
  State<CallLOGMB> createState() => _CallLOGMBState();
}

class _CallLOGMBState extends State<CallLOGMB> {
  final LocalStorage storage = LocalStorage("Localstorage_app");

  void callbackDispatcher() {
    Workmanager().executeTask((dynamic task, dynamic inputData) async {
      print('Background Services are Working!');
      try {
        final Iterable<CallLogEntry> cLog = await CallLog.get();
        print('Queried call log entries');
        for (CallLogEntry entry in cLog) {
          print('-------------------------------------');
          print('F. NUMBER  : ${entry.formattedNumber}');
          print('C.M. NUMBER: ${entry.cachedMatchedNumber}');
          print('NUMBER     : ${entry.number}');
          print('NAME       : ${entry.name}');
          print('TYPE       : ${entry.callType}');
          // print('DATE       : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp)}');
          print('DURATION   : ${entry.duration}');
          print('ACCOUNT ID : ${entry.phoneAccountId}');
          print('ACCOUNT ID : ${entry.phoneAccountId}');
          print('SIM NAME   : ${entry.simDisplayName}');
          print('-------------------------------------');
        }
        return true;
      } on PlatformException catch (e, s) {
        print(e);
        print(s);
        return true;
      }
    });
  }

  Iterable<CallLogEntry> _callLogEntries = <CallLogEntry>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

    showcall();
  }

  showcall() async {
    final Iterable<CallLogEntry> result = await CallLog.query();
    setState(() {
      _callLogEntries = result;
    });

    var item = [];

    for (CallLogEntry entry in _callLogEntries) {
      var number = entry.number;
      var name = entry.name;

      if (entry.name == null || entry.name == "") {
        name = "user";
      }
      item.add({"number": number, "name": name});

      await storage.setItem("Call_Log", item);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final List<Widget> children = <Widget>[];

    for (CallLogEntry entry in _callLogEntries) {
      children.add(
        Column(
          children: <Widget>[
            const Divider(),
            // Text('F. NUMBER  : ${entry.formattedNumber}', style: mono),
            // Text('C.M. NUMBER: ${entry.cachedMatchedNumber}', style: mono),
            ListTile(
              leading: entry.name == null
                  ? Text(
                      "User",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  : Text('${entry.name}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
              title: Center(
                  child: Text(
                '${entry.number}',
              )),
              trailing: entry.callType == CallType.missed
                  ? Icon(
                      Icons.phone_callback,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.phone_callback,
                      color: Colors.green,
                    ),

              // Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           entry.name == null
              //               ? Text("User",style: TextStyle(fontWeight: FontWeight.bold),)
              //               : Text('${entry.name}', style: TextStyle(fontWeight: FontWeight.bold)),
              //         Text('${entry.number}', style: TextStyle(fontWeight: FontWeight.bold)),
              //         entry.callType== CallType.missed ?   Icon(Icons.phone_callback,color: Colors.red,):
              //         Icon(Icons.phone_callback,color: Colors.green,)
              //         ],
              //       ),

              // Text('DATE       : ${DateTime.fromMillisecondsSinceEpoch(entry.timestamp)}',
              // style: mono),
              // Text('DURATION   : ${entry.duration}', style: mono),
              // Text('ACCOUNT ID : ${entry.phoneAccountId}', style: mono),
              // Text('SIM NAME   : ${entry.simDisplayName}', style: mono),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      );
    }

    return Scaffold(
      drawer: MyDrawer(),
      bottomNavigationBar: NaviBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Positioned(
              top: 20,
              child: Icon(
                Icons.apps,
                color: Colors.black,
              ),
            ),
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(children: [
          Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              child: Image.asset(
                            "assets/icon.png",
                            height: 30,
                            width: 30,
                          ))),
                    ),
                    SizedBox(
                      width: width * 0.20,
                    ),
                    Container(
                        child: Text(
                      "Call Logs",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.center,
                    )),
                  ]))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: children),
          ),
        ])),
      ),
    );
  }
}
