// ignore_for_file: prefer_const_constructors

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
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:flutter_image_gallery/flutter_image_gallery.dart';
import 'package:localstorage/localstorage.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:workmanager/workmanager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:image_picker/image_picker.dart';
import 'package:archive/archive_io.dart';
import 'package:file_picker/file_picker.dart';

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
  var files = [];

  List<Album>? _albums;
  var TWO_PI = 3.14 * 2;

  List<Contact>? contacts;
  final LocalStorage storage = LocalStorage("Localstorage_app");
  var contactlist = [];

  // final LocalStorage storage = LocalStorage("Localstorage_app");

  final String userName = Random().nextInt(10000).toString();

  final Strategy strategy = Strategy.P2P_STAR;
  Map<String, ConnectionInfo> endpointMap = Map();

  String? tempFileUri; //reference to the file currently being transferred
  Map<int, String> map = Map();

  void initState() {
    super.initState();
    // initAsync();
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

  void data() async {
    print("ok1");

    var getuser= [ ];
    print(userget.length);


    for (var i = 0; i < 5; i++) {
      if (i == 0) {
        if (i1 == true) {
          getuser.add("Image/Videos");
          if (await _promptPermissionSetting()) {
            List<Album> albums =
                await PhotoGallery.listAlbums(mediumType: MediumType.image);

            var allImageTemp;
            allImageTemp = await FlutterImageGallery.getAllImages;

            var allImage = allImageTemp['URIList'] as List;
            print(allImage);

            List albmain = [];

            Directory? appDocDirectory = await getExternalStorageDirectory();
            print(appDocDirectory);
            print("object");
            var encoder = ZipFileEncoder();
            encoder.create(appDocDirectory!.path + "/" + 'imagegallery.zip');
            // encoder.open(appDocDirectory!.path + "/" + 'newimages.zip');

            for (var i = 0; i < 60; i++) {
              var imgfile = File(allImage[i]);
              print(imgfile.runtimeType);
              await encoder.addFile(imgfile);
            }
            encoder.close();
          }
          // setState(() {});
        }
      }
      if (i == 1) {
        if (i2 == true) {
           getuser.add("Files");
          await handlerpermssion();

          // setState(() {});
        }
      }
      if (i == 2) {
        if (i3 == true) {
           getuser.add("Contact");
          getContact();

          // setState(() {});
        }
      }
      if (i == 3) {
        if (i4 == true) {
           getuser.add("Call Log");

          // await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
          await showcall();
    
          // setState(() {});
        }
      }
      if (i == 4) {
        if (i5 == true) {
           getuser.add("App Data");
          // setState(() {});
        }
      }
    }
    setState(() {
      userget= getuser;
      
    });
    print(userget);
  }




  showcall() async {
    final Iterable<CallLogEntry> result = await CallLog.query();

    print(result);
    // setState(() {
    //   _callLogEntries = result;
    // });

    var item = [];

    for (CallLogEntry entry in result) {
      var number = entry.number;
      var name = entry.name;

      if (entry.name == null || entry.name == "") {
        name = "user";
      }
      item.add({"number": number, "name": name});

      await storage.setItem("Call_Log", item);
    }
    Directory? appDocDirectory = await getExternalStorageDirectory();

    print(appDocDirectory?.path);

    var file = File(appDocDirectory!.path + "/calldata.txt");
    print(file);

    await file.writeAsString(item.toString());
    print(file);
    return file;
  }





  getContact() async {
    await Permission.contacts.request();

    final PermissionStatus permission = await Permission.contacts.status;
    print("permission :" + permission.toString());

    if (permission.isDenied) {
      print("permission :" + permission.toString());
      Permission.contacts.request();
    } else if (permission.isGranted) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      // print(contacts);

      for (var i = 0; i < 100; i++) {
        // print(contacts![i].phones.first.number);

        if (contacts![i].phones.first.number != null) {
          var username = contacts![i].name.first + contacts![i].name.last;
          var number = contacts![i].phones.first.number;

          if (username == "") {
            username = "user";
          }
          if (number == "") {
            number = "no number";
          }

          contactlist
              .add({"name": username, "number": number, "isCheck": false});
        }
      }
      print(contactlist);

      Directory? appDocDirectory = await getExternalStorageDirectory();

      print(appDocDirectory?.path);

      var file = File(appDocDirectory!.path + "/contactdata.txt");
      print(file);

      await file.writeAsString(contactlist.toString());
      print(file);

      // await storage.setItem('Contact', contactlist);
      // setState(() {});
      return 0;
    }
  }

  Future handlerpermssion() async {
    var permission = await Permission.storage;
    print("objectPER");
    // print(permission.status.isGranted);
    if (permission.status == PermissionStatus.granted) {
      print("Permsiion");
      return getFiles();
    } else {
      await Permission.storage.request();

      return getFiles();
    }
    // bool permission = await requestPermissionHelper(Permission.manageExternalStorage);
  }

  void getFiles() async {
    //asyn function to get list of files
    List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    var root = storageInfo[0]
        .rootDir; //storageInfo[1] for SD card, geting the root directory
    var fm = FileManager(root: Directory(root));

    print(fm);

    files = await fm.filesTree(
        //set fm.dirsTree() for directory/folder tree list
        excludedPaths: ["/storage/emulated/0/Android"],
        extensions: ["fig", "pdf", "docx"]);
    print(files[0].runtimeType);
    Directory? appDocDirectory = await getExternalStorageDirectory();
    print(appDocDirectory);
    var encoder = ZipFileEncoder();
    // encoder.create(appDocDirectory!.path + "/" + 'newFile.zip');
    encoder.open(appDocDirectory!.path + "/" + 'file.zip');
    // setState(() {});
    // }

    for (var i = 0; i < files.length; i++) {
      try {
        await encoder.addFile(files[i]);
      } catch (E) {
        // ignore: avoid_print
        print(E.toString());
      }
    }

    //  await  encoder.addFile(files[1]);
    // await  encoder.addFile(files[2]);
    // await    encoder.addFile(files[3]);
    //   await encoder.addFile(files[4]);
    //  await  encoder.addFile(files[5]);
    //  await  encoder.addFile(files[6]);
    //  await   encoder.addFile(files[7]);
    // await  encoder.addFile(files[8]);
//    await encoder.addFile(files[9]);
//    await encoder.addFile(files[0]);
//   await  encoder.addFile(files[11]);
//   await  encoder.addFile(files[12]);
//   await   encoder.addFile(files[13]);
//   await  encoder.addFile(files[14]);
//   await  encoder.addFile(files[15]);
//   await  encoder.addFile(files[16]);
//   await   encoder.addFile(files[17]);
//  await   encoder.addFile(files[18]);
//    await  encoder.addFile(files[19]);
//   await  encoder.addFile(files[20]);
//    await  encoder.addFile(files[21]);
//     await  encoder.addFile(files[22]);
//      await  encoder.addFile(files[23]);
//       await  encoder.addFile(files[24]);
//       await  encoder.addFile(files[25]);
//     await   encoder.addFile(files[26]);
//    await  encoder.addFile(files[27]);
//   await  encoder.addFile(files[28]);
//    await  encoder.addFile(files[29]);
//     await  encoder.addFile(files[30]);
//      await  encoder.addFile(files[31]);
//       await  encoder.addFile(files[32]);
//       await  encoder.addFile(files[33]);

    encoder.close();
  }



  callbackDispatcher() {
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





  @override
  Widget build(BuildContext context) {
     final size = 200.0;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Widget FourBoxes() {
      return Container(
        height: height * 0.18,
        width: width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient:
                // ignore: prefer_const_literals_to_create_immutables
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
          SizedBox(
            height: 50,
          ),
          Divider(),
          
          userget.length == 0 ? 
          // Padding(
          //   padding: const EdgeInsets.only(left:100,right:30.0),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Center(
          //         child: CircularProgressIndicator(
          //           color: Colors.green,
          //           strokeWidth: 10,
                    
          //         ),
          //       ),
          //       Text("Wait For Making Backup For Sharing",style: TextStyle(fontSize: 25,color: Colors.red,fontWeight: FontWeight.bold),)
          //     ],
          //   ),
          // )
          Center(
            child: Container(
              width: size,
              height: size,
              color: Colors.blue,
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect){
                     return SweepGradient(
                            startAngle: 0.0,
                            endAngle: TWO_PI,
                            // stops: [value,value],
                            // 0.0 , 0.5 , 0.5 , 1.0
                            center: Alignment.center,
                            colors: [Colors.blue,Colors.grey.withAlpha(55)]
                        ).createShader(rect);
                      },
                   child: Container(
                    width: size,
                    height:size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                   ),   
                  )
                ],
              ),
            ),
          )
          :
          Text("BACKUP DONE")
          // Column(
          //   children: <Widget>[
              // Container(
              //   margin: EdgeInsets.only(top: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Center(child: Text("User Name: " + userName)),
              //     ],
              //   ),
              // ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
                  // ElevatedButton(
                  //   child: Text("Send Device"),
                  //   onPressed: () async {
                  //     try {
                  //       bool a = await Nearby().startAdvertising(
                  //         userName,
                  //         strategy,
                  //         onConnectionInitiated: onConnectionInit,
                  //         onConnectionResult: (id, status) {
                  //           showSnackbar(status);
                  //         },
                  //         onDisconnected: (id) {
                  //           showSnackbar(
                  //               "Disconnected: ${endpointMap[id]!.endpointName}, id $id");
                  //           setState(() {
                  //             endpointMap.remove(id);
                  //           });
                  //         },
                  //       );
                  //       showSnackbar("ADVERTISING: " + a.toString());
                  //     } catch (exception) {
                  //       showSnackbar(exception);
                  //     }
                  //   },
                  // ),
          //       ],
          //     ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     ElevatedButton(
              //       child: Text("Recieve Device"),
              //       onPressed: () async {
              //         try {
              //           bool a = await Nearby().startDiscovery(
              //             userName,
              //             strategy,
              //             onEndpointFound: (id, name, serviceId) {
              //               showModalBottomSheet(
              //                 context: context,
              //                 builder: (builder) {
              //                   return Center(
              //                     child: Column(
              //                       children: <Widget>[
              //                         Text("id: " + id),
              //                         Text("Name: " + name),
              //                         Text("ServiceId: " + serviceId),
              //                         ElevatedButton(
              //                           child: Text("Request Connection"),
              //                           onPressed: () {
              //                             Navigator.pop(context);
              //                             Nearby().requestConnection(
              //                               userName,
              //                               id,
              //                               onConnectionInitiated: (id, info) {
              //                                 onConnectionInit(id, info);
              //                               },
              //                               onConnectionResult: (id, status) {
              //                                 showSnackbar(status);
              //                               },
              //                               onDisconnected: (id) {
              //                                 setState(() {
              //                                   endpointMap.remove(id);
              //                                 });
              //                                 showSnackbar(
              //                                     "Disconnected from: ${endpointMap[id]!.endpointName}, id $id");
              //                               },
              //                             );
              //                           },
              //                         ),
              //                       ],
              //                     ),
              //                   );
              //                 },
              //               );
              //             },
              //             onEndpointLost: (id) {
              //               showSnackbar(
              //                   "Lost discovered Endpoint: ${endpointMap[id]!.endpointName}, id $id");
              //             },
              //           );
              //           showSnackbar("DISCOVERING: " + a.toString());
              //         } catch (e) {
              //           showSnackbar(e);
              //         }
              //       },
              //     ),
              //   ],
              // ),
          //     Text("Number of connected devices: ${endpointMap.length}"),
          //     ElevatedButton(
          //       child: Text("Send File Payload"),
          //       onPressed: () async {
          //         FilePickerResult? result =
          //             await FilePicker.platform.pickFiles();
          //         if (result == null)
          //           return; // if user don't pick any thing then do nothing just return.
          //         PlatformFile file = result.files.first;
          //         print(file);
          //         // PickedFile? file =
          //         //     await ImagePicker().getImage(source: ImageSource.gallery);

          //         // print(file!.path.split('/').last.codeUnits);

          //         // if (file == null) return;

          //         for (MapEntry<String, ConnectionInfo> m
          //             in endpointMap.entries) {
          //           int payloadId = await Nearby()
          //               .sendFilePayload(m.key, file.path.toString());
          //           showSnackbar("Sending file to ${m.key}");
          //           Nearby().sendBytesPayload(
          //               m.key,
          //               Uint8List.fromList(
          //                   "$payloadId:${file.path!.split('/').last}"
          //                       .codeUnits));
          //         }
          //       },
          //     ),
          //     ElevatedButton(
          //       child: Text("Print file names."),
          //       onPressed: () async {
          //         final dir = (await getExternalStorageDirectory())!;
          //         final files = (await dir.list(recursive: true).toList())
          //             .map((f) => f.path)
          //             .toList()
          //             .join('\n');
          //         showSnackbar(files);
          //       },
          //     ),
          //   ],
          // ),
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
                          String name = map[payloadTransferUpdate.id]!;
                          moveFile(tempFileUri!, name);
                        } else {
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
