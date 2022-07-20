import 'dart:math';

import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:diagnose/pages/backup_restor/data_sharing/reciving_stop.dart';
import 'package:flutter/material.dart';
import 'package:nearby_connections/nearby_connections.dart';
import 'package:page_transition/page_transition.dart';

class RecievingData extends StatefulWidget {
  const RecievingData({Key? key}) : super(key: key);

  @override
  State<RecievingData> createState() => _RecievingDataState();
}

class _RecievingDataState extends State<RecievingData> {

  final String userName = Random().nextInt(10000).toString();

  final Strategy strategy = Strategy.P2P_STAR;
  Map<String, ConnectionInfo> endpointMap = Map();

  String? tempFileUri; //reference to the file currently being transferred
  Map<int, String> map = Map();

   void initState() {
    super.initState();
    // initAsync();
    locationpermsion();
    // _promptPermissionSetting();
    // data();
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



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: NaviBar(),
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.apps,
                  color: Colors.black,
                ),
              );
            }),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: height * 0.65,
              ),
              // Center(
              //   child: Text(
              //     "Wait this process take a time\nDo not close application.",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       decoration: TextDecoration.none,
              //       fontFamily: "Advent Pro",
              //       fontSize: 12,
              //       fontWeight: FontWeight.w400,
              //       color: Colors.black,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Text(
                  "Reciving...",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: "Roboto",
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1DBF73)),
                ),
              ),
            ),
            // SizedBox(
            //   height: height * 0.3,
            // ),
             Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("User Name: " + userName,style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 15,color: Colors.black),)),
                  ],
                ),
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
                                              // showSnackbar(status);
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
            // // Container(
            // //   height: height * 0.15,
            // //   width: width * 0.35,
            // //   decoration: BoxDecoration(
            // //       borderRadius: BorderRadius.circular(5),
            // //       boxShadow: [
            // //         BoxShadow(
            // //             blurRadius: 10,
            // //             color: Colors.grey.withOpacity(0.3),
            // //             spreadRadius: 10)
            // //       ],
            // //       color: Colors.white),
            // //   child: Column(
            // //     mainAxisAlignment: MainAxisAlignment.center,
            // //     crossAxisAlignment: CrossAxisAlignment.center,
            // //     children: [
            // //       Text(
            // //         "Request for sahring\ndata",
            // //         textAlign: TextAlign.center,
            // //         style: TextStyle(
            // //           decoration: TextDecoration.none,
            // //           fontFamily: "Advent Pro",
            // //           fontSize: 12,
            // //           fontWeight: FontWeight.w400,
            // //           color: Color(0xFF000000),
            // //         ),
            // //       ),
            //       SizedBox(
            //         height: height * 0.02,
            //       ),
            //       GestureDetector(
            //         onTap: (){
            //          Navigator.push(
            //           context,
            //           PageTransition(
            //               type: PageTransitionType.topToBottom,
            //               reverseDuration: Duration(seconds: 1),
            //               duration: Duration(seconds: 1),
            //               child: RecievingStop()));
            //         },
            //         child: Text(
            //           "Accept",
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             decoration: TextDecoration.none,
            //             fontFamily: "Advent Pro",
            //             fontSize: 12,
            //             fontWeight: FontWeight.w400,
            //             color: Color(0xFF1DBF73),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: height * 0.2,
            // ),
            // Text(
            //   "0%",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     decoration: TextDecoration.none,
            //     fontFamily: "Roboto",
            //     fontSize: 24,
            //     fontWeight: FontWeight.w700,
            //     color: Color(0xFF191D21),
            //   ),
            // ),
          ],
        ),
      ],
    );
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
                              // moveFile(tempFileUri!, fileName);
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
                          // moveFile(tempFileUri!, name);
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
