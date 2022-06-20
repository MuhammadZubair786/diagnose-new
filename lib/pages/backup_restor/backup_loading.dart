import 'dart:async';
import 'dart:io';
import 'package:call_log/call_log.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:diagnose/pages/backup_restor/restore/data_backup_restore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:workmanager/workmanager.dart';

class DataBackupLoadingMB extends StatefulWidget {
  var i1;
  var i2;
  var i3;
  var i4;
  var i5;
  DataBackupLoadingMB(this.i1, this.i2, this.i3, this.i4, this.i5);

  @override
  State<DataBackupLoadingMB> createState() =>
      _DataBackupLoadingMBState(i1, i2, i3, i4, i5);
}

class _DataBackupLoadingMBState extends State<DataBackupLoadingMB> {
  var i1;
  var i2;
  var i3;
  var i4;
  var i5;
  _DataBackupLoadingMBState(this.i1, this.i2, this.i3, this.i4, this.i5);
  @override
  var userget = [];

  List<Album>? _albums;
  void initState() {
    super.initState();
    data();
    chk();

    startBackup();
  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS &&
            await Permission.storage.request().isGranted &&
            await Permission.photos.request().isGranted ||
        Platform.isAndroid && await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }

  Future<void> initAsync() async {
    if (await _promptPermissionSetting()) {
      List<Album> albums =
          await PhotoGallery.listAlbums(mediumType: MediumType.image);

          print(albums);
      setState(() {
        _albums = albums;
      });
    }
  }


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


  void startBackup() {
    if (i1 == true) {
      initAsync();
    }
    if (i4 == true) {
       Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
    }
  }

  void chk() {
    print(userget);
  }

  void data() async {
    for (var i = 0; i < 5; i++) {
      if (i == 0) {
        if (i1 == true) {
          userget.add("Image/Videos");
          setState(() {});
        }
      }
      if (i == 1) {
        if (i2 == true) {
          userget.add("Files");
          setState(() {});
        }
      }
      if (i == 2) {
        if (i3 == true) {
          userget.add("Contact");
          setState(() {});
        }
      }
      if (i == 3) {
        if (i4 == true) {
          userget.add("Call Log");
          setState(() {});
        }
      }
      if (i == 4) {
        if (i5 == true) {
          userget.add("App Data");
          setState(() {});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Widget FourBoxes() {
      return Container(
        height: height * 0.18,
        width: width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient:
                LinearGradient(colors: [Color(0xFF1DBF73), Color(0xFF00ACEE)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFE8E8E8)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFE8E8E8)),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFE8E8E8)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFE8E8E8)),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: NaviBar(),
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.apps,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 110.0),
                        child: Text(
                          "Data Backup",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Roboto',
                              color: Color(0XFF191D21),
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FourBoxes(),
              SizedBox(
                height: height * 0.05,
              ),

              // SizedBox(
              //   height: height * 0.011,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     // Navigator.push(
              //     //     context,
              //     //     PageTransition(
              //     //         type: PageTransitionType.rightToLeft,
              //     //         reverseDuration: Duration(seconds: 1),
              //     //         duration: Duration(seconds: 1),
              //     //         child: Databack()));
              //   },
              //   child: Container(
              //     width: width * 0.8,
              //     height: height * 0.06,
              //     child: Container(
              //       width: 337,
              //       height: 52,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(5),
              //           topRight: Radius.circular(5),
              //           bottomLeft: Radius.circular(5),
              //           bottomRight: Radius.circular(5),
              //         ),
              //         boxShadow: [
              //           BoxShadow(
              //               color: Color.fromRGBO(0, 0, 0, 0.25),
              //               offset: Offset(2, 2),
              //               blurRadius: 42)
              //         ],
              //         color: Color.fromRGBO(255, 255, 255, 1),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Text(
              //             'App Data',
              //             textAlign: TextAlign.left,
              //             style: TextStyle(
              //                 color: Color.fromRGBO(0, 0, 0, 1),
              //                 fontFamily: 'Roboto',
              //                 fontSize: 16,
              //                 letterSpacing: 0,
              //                 fontWeight: FontWeight.normal,
              //                 height: 1.5),
              //           ),
              //           SizedBox(
              //             width: width * 0.4,
              //           ),
              //           Icon(
              //             Icons.check_box,
              //             color: Colors.green,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              // Text(
              //   "Make sure your mobile is connected with system",
              //   style: TextStyle(
              //       decoration: TextDecoration.none,
              //       color: Colors.black.withOpacity(0.7),
              //       fontSize: 12,
              //       fontWeight: FontWeight.w400,
              //       fontFamily: 'Advent Pro'),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     width: width * 0.79,
              //     height: height * 0.06,
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         shape: RoundedRectangleBorder(
              //           side: BorderSide(
              //             color: Color(0xFF1DBF73),
              //           ),
              //           borderRadius: BorderRadius.circular(5),
              //         ),
              //         primary: Colors.white,
              //         elevation: 6,
              //       ),
              //       onPressed: () {
              //         // Navigator.push(
              //         //     context,
              //         //     MaterialPageRoute(
              //         //       builder: (context) => BackupLoadingBR(),
              //         //     ));
              //       },
              //       child: const Text(
              //         "Make a backup",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           letterSpacing: 2,
              //           fontWeight: FontWeight.w600,
              //           fontSize: 16,
              //           color: Colors.black,
              //           fontFamily: 'Roboto',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          SizedBox(
            height: height * 0.2,
          ),
          ListView.builder(
              itemCount: userget.length,
              itemBuilder: (context, index) {
                return Container(
                  width: width * 0.8,
                  height: height * 0.06,
                  margin:
                      EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                  child: Container(
                    width: 337,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(2, 2),
                            blurRadius: 42)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Center(
                            child: Text(
                              userget[index],
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.25,
                        ),
                        // Icon(
                        //   Icons.check_box,
                        //   color: Colors.green,
                        // ),
                      ],
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
