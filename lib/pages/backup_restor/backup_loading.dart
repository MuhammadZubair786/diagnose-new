import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:call_log/call_log.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:diagnose/pages/backup_restor/restore/data_backup_restore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:workmanager/workmanager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:image_picker/image_picker.dart';
import 'package:archive/archive_io.dart';

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

   final LocalStorage storage = LocalStorage("Localstorage_app");

    final String userName = Random().nextInt(10000).toString();

      final Strategy strategy = Strategy.P2P_STAR;
  Map<String, ConnectionInfo> endpointMap = Map();

  String? tempFileUri; //reference to the file currently being transferred
  Map<int, String> map =
      Map(); 


  void initState() {
    super.initState();
    initAsync();
    locationpermsion();
    _promptPermissionSetting();
    data(); 
    // chk1();

    // startBackup();
  }



  locationpermsion() async {
    await Nearby().askLocationPermission();
    await Nearby().checkBluetoothPermission();
    await Nearby().enableLocationServices();
  }


  void showSnackbar(dynamic a) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(a.toString()),
    ));
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

          // print(albums);
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
    print("ok1");
    // print(FirebaseAuth.instance.currentUser!.uid);

    var call = await storage.getItem("Call_Log");
    // print(call[0]["number"]);
 
    // await FlutterShare.share(title: "Share",text:call.toString());  

  
    // await share

    var contact = await storage.getItem("Contact");
    //  await FirebaseFirestore.instance.collection("Data Store").doc(FirebaseAuth.instance.currentUser!.uid).collection("Backup")
    // .doc().set({
    //   "call_Backup":call,
    //   "Contact_Backup":contact
    // });


    // print(contact);


 

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
      print(userget);

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
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 20, bottom: 10),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(left: 110.0),
              //           child: Text(
              //             "Data Backup",
              //             style: TextStyle(
              //                 fontSize: 25,
              //                 fontFamily: 'Roboto',
              //                 color: Color(0XFF191D21),
              //                 decoration: TextDecoration.none),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // FourBoxes(),
              // SizedBox(
              //   height: height * 0.05,
              // ),
              // ElevatedButton(onPressed: (){}
              // , child: Text("Click")),
              

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
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white.withOpacity(0.9),
          //   ),
          // ),
          // SizedBox(
          //   height: height * 0.2,
          // ),
          // ListView.builder(
          //     itemCount: userget.length,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         width: width * 0.8,
          //         height: height * 0.06,
          //         margin:
          //             EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
          //         child: Container(
          //           width: 337,
          //           height: 52,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.only(
          //               topLeft: Radius.circular(5),
          //               topRight: Radius.circular(5),
          //               bottomLeft: Radius.circular(5),
          //               bottomRight: Radius.circular(5),
          //             ),
          //             boxShadow: [
          //               BoxShadow(
          //                   color: Color.fromRGBO(0, 0, 0, 0.25),
          //                   offset: Offset(2, 2),
          //                   blurRadius: 42)
          //             ],
          //             color: Color.fromRGBO(255, 255, 255, 1),
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.only(left: 70),
          //                 child: Center(
          //                   child: Text(
          //                     userget[index],
          //                     textAlign: TextAlign.left,
          //                     style: TextStyle(
          //                         color: Color.fromRGBO(0, 0, 0, 1),
          //                         fontFamily: 'Roboto',
          //                         fontSize: 16,
          //                         letterSpacing: 0,
          //                         fontWeight: FontWeight.normal,
          //                         height: 1.5),
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: width * 0.25,
          //               ),
          //               // Icon(
          //               //   Icons.check_box,
          //               //   color: Colors.green,
          //               // ),
          //             ],
          //           ),
          //         ),
          //       );
          //     }),
              SizedBox(height: 50,),
               Divider(),


              
             Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text("User Name: " + userName)),
                ],
              ),
            ),

                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: Text("Send Device"),
                      onPressed: () async {
                        try {
                          bool a = await Nearby().startAdvertising(
                            userName,
                            strategy,
                            onConnectionInitiated: onConnectionInit,
                            onConnectionResult: (id, status) {
                              showSnackbar(status);
                            },
                            onDisconnected: (id) {
                              showSnackbar(
                                  "Disconnected: ${endpointMap[id]!.endpointName}, id $id");
                              setState(() {
                                endpointMap.remove(id);
                              });
                            },
                          );
                          showSnackbar("ADVERTISING: " + a.toString());
                        } catch (exception) {
                          showSnackbar(exception);
                        }
                      },
                    ),
                  ],
                ),
               
           
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: Text("Recieve Device"),
                      onPressed: () async {
                        try {
                          bool a = await Nearby().startDiscovery(
                            userName,
                            strategy,
                            onEndpointFound: (id, name, serviceId) {
                              // show sheet automatically to request connection
                              showModalBottomSheet(
                                context: context,
                                builder: (builder) {
                                  return Center(
                                    child: Column(
                                      children: <Widget>[
                                        Text("id: " + id),
                                        Text("Name: " + name),
                                        Text("ServiceId: " + serviceId),
                                        ElevatedButton(
                                          child: Text("Request Connection"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Nearby().requestConnection(
                                              userName,
                                              id,
                                              onConnectionInitiated: (id, info) {
                                                onConnectionInit(id, info);
                                              },
                                              onConnectionResult: (id, status) {
                                                showSnackbar(status);
                                              },
                                              onDisconnected: (id) {
                                                setState(() {
                                                  endpointMap.remove(id);
                                                });
                                                showSnackbar(
                                                    "Disconnected from: ${endpointMap[id]!.endpointName}, id $id");
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            onEndpointLost: (id) {
                              showSnackbar(
                                  "Lost discovered Endpoint: ${endpointMap[id]!.endpointName}, id $id");
                            },
                          );
                          showSnackbar("DISCOVERING: " + a.toString());
                        } catch (e) {
                          showSnackbar(e);
                        }
                      },
                    ),
               
                  ],
                ),
               
                 Text("Number of connected devices: ${endpointMap.length}"),
                 ElevatedButton(
              child: Text("Send File Payload"),
              onPressed: () async {
                PickedFile? file =
                    await ImagePicker().getImage(source: ImageSource.gallery);

                    print(file!.path.split('/').last.codeUnits);

                if (file == null) return;

                for (MapEntry<String, ConnectionInfo> m
                    in endpointMap.entries) {
                  int payloadId =
                      await Nearby().sendFilePayload(m.key, file.path);

                      // await Nearby().sendBytesPayload(endpointId, bytes)
                      
                  showSnackbar("Sending file to ${m.key}");
                  Nearby().sendBytesPayload(
                      m.key,
                      Uint8List.fromList(
                          "$payloadId:${file.path.split('/').last}".codeUnits));
                }
              },
            ),
            ElevatedButton(
              child: Text("Print file names."),
              onPressed: () async {
                final dir = (await getExternalStorageDirectory())!;
                final files = (await dir.list(recursive: true).toList())
                    .map((f) => f.path)
                    .toList()
                    .join('\n');
                showSnackbar(files);
              },
            ),
            // ElevatedButton(
            // child: Text("Stop All Endpoints"),
            // onPressed: () async {
            //   await Nearby().stopAllEndpoints();
            //   setState(() {
            //     endpointMap.clear();
            //   });
            // },
            // ),
              ],
              
            ),
           
        ],
      ),
    );
  }

    Future<bool> moveFile(String uri, String fileName) async {
    String parentDir = (await getExternalStorageDirectory())!.absolute.path;
    final b =
        await Nearby().copyFileAndDeleteOriginal(uri, '$parentDir/$fileName');

    showSnackbar("Moved file:" + b.toString());
    return b;
  }


  
  void onConnectionInit(String id, ConnectionInfo info) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Center(
          child: Column(
            children: <Widget>[
              Text("id: " + id),
              Text("Token: " + info.authenticationToken),
              Text("Name" + info.endpointName),
              Text("Incoming: " + info.isIncomingConnection.toString()),
              ElevatedButton(
                child: Text("Accept Connection"),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    endpointMap[id] = info;
                  });
                  Nearby().acceptConnection(
                    id,
                    onPayLoadRecieved: (endid, payload) async {
                      if (payload.type == PayloadType.BYTES) {
                        String str = String.fromCharCodes(payload.bytes!);
                        showSnackbar(endid + ": " + str);

                        if (str.contains(':')) {
                          // used for file payload as file payload is mapped as
                          // payloadId:filename
                          int payloadId = int.parse(str.split(':')[0]);
                          String fileName = (str.split(':')[1]);

                          if (map.containsKey(payloadId)) {
                            if (tempFileUri != null) {
                              moveFile(tempFileUri!, fileName);
                            } else {
                              showSnackbar("File doesn't exist");
                            }
                          } else {
                            //add to map if not already
                            map[payloadId] = fileName;
                          }
                        }
                      } else if (payload.type == PayloadType.FILE) {
                        showSnackbar(endid + ": File transfer started");
                        tempFileUri = payload.uri;
                      }
                    },
                    onPayloadTransferUpdate: (endid, payloadTransferUpdate) {
                      if (payloadTransferUpdate.status ==
                          PayloadStatus.IN_PROGRESS) {
                        print(payloadTransferUpdate.bytesTransferred);
                      } else if (payloadTransferUpdate.status ==
                          PayloadStatus.FAILURE) {
                        print("failed");
                        showSnackbar(endid + ": FAILED to transfer file");
                      } else if (payloadTransferUpdate.status ==
                          PayloadStatus.SUCCESS) {
                        showSnackbar(
                            "$endid success, total bytes = ${payloadTransferUpdate.totalBytes}");

                        if (map.containsKey(payloadTransferUpdate.id)) {
                          //rename the file now
                          String name = map[payloadTransferUpdate.id]!;
                          moveFile(tempFileUri!, name);
                        } else {
                          //bytes not received till yet
                          map[payloadTransferUpdate.id] = "";
                        }
                      }
                    },
                  );
                },
              ),
              ElevatedButton(
                child: Text("Reject Connection"),
                onPressed: () async {
                  Navigator.pop(context);
                  try {
                    await Nearby().rejectConnection(id);
                  } catch (e) {
                    showSnackbar(e);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
