import 'package:diagnose/pages/full_test_screens/hardware_testft/charging_test_ht.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/originality_test_ht.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:io';
import 'dart:math';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class StressTestHT extends StatefulWidget {
  const StressTestHT({Key? key}) : super(key: key);

  @override
  State<StressTestHT> createState() => _StressTestHTState();
}

class _StressTestHTState extends State<StressTestHT> {
  late String deviceName;

  late String deviceVersion;

  late String identifier;

  @override
  void initState() {
    super.initState();
    getDeviceDetails();
  }

  getDeviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceName = build.model;
        deviceVersion = build.version.toString();
        identifier = build.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceName = data.name;
        deviceVersion = data.systemVersion;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

//if (!mounted) return;
    print(deviceName);
    print(deviceVersion);
    print(identifier);
    name = deviceName;
    setState(() {});
// return [deviceName, deviceVersion, identifier];
  }

  var SM_J260F_Battery = [
    5,
    10,
    10,
    20,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    10,
    5,
    5,
    5,
    10,
    20,
    25,
    10,
    20,
    25,
    10,
    5,
    5,
    20,
    20,
    20,
    20,
    10,
    5,
    5,
    5,
    10,
    20,
    25,
    10,
    10,
    20,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    10,
    5,
    5,
    5,
    10,
    20,
    25
  ];

  var SM_J260F_Memory = [
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    10,
    5,
    5,
    5,
    10,
    20,
    25,
    10,
    20,
    25,
    1,
    10,
    10,
    20,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    10,
    5,
    5,
    5,
    10,
    20,
    25,
    10,
    20,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    10,
    5,
    5,
    5,
    10,
    20,
    25,
    10,
    10,
    10,
    10
  ];

  var SM_J260F_Battery1 = [
    10,
    5,
    10,
    5,
    20,
    20,
    10,
    10,
    5,
    10,
    10,
    30,
    20,
    10,
    5,
    10,
    10,
    10,
    40,
    30,
    50,
    30,
    20,
    20,
    20,
    10,
    30,
    40,
    50,
    20,
    20,
    10,
    101,
    10,
    30,
    20,
    20,
    10,
    20,
    10,
    20,
    30,
    40,
    30,
    20,
    10,
    10
  ];

  var SM_J260F_Memory1 = [
    5,
    10,
    10,
    10,
    20,
    20,
    30,
    10,
    20,
    10,
    10,
    5,
    5,
    5,
    10,
    10,
    30,
    20,
    20,
    20,
    20,
    10,
    10,
    20,
    20,
    20,
    20,
    10,
    10,
    10,
    15,
    15,
    15,
    14,
    13,
    14,
    15,
    10,
    10,
    10,
    20,
    20,
    20,
    10,
    30,
    20,
    202,
    20,
    20
  ];

  var SM_J260F_Battery2 = [
    10,
    10,
    10,
    10,
    10,
    10,
    20,
    20,
    10,
    10,
    20,
    20,
    20,
    10,
    30,
    30,
    10,
    10,
    10,
    5,
    10,
    50,
    10,
    10,
    5,
    5,
    10,
    10,
    10,
    10,
    5,
    10,
    10,
    10,
    10,
    10,
    5,
    10,
    12,
    15,
    10,
    10,
    5,
    40,
    10,
    20,
    10,
    20,
    20,
    30,
    30
  ];

  var SM_J260F_Memory2 = [
    10,
    20,
    10,
    10,
    10,
    30,
    20,
    20,
    20,
    30,
    30,
    30,
    40,
    10,
    10,
    10,
    10,
    20,
    10,
    15,
    5,
    10,
    20,
    5,
    10,
    5,
    10,
    10,
    3,
    10,
    10,
    10,
    20,
    10,
    10,
    10,
    20,
    20,
    20,
    20,
    20,
    20,
    10,
    10,
    10,
    15,
    10,
    20,
    20,
    20,
    20,
  ];

  var SM_J260F_Battery3 = [
    10,
    20,
    20,
    20,
    10,
    10,
    10,
    20,
    5,
    10,
    1,
    3,
    5,
    10,
    10,
    10,
    10,
    20,
    20,
    20,
    10,
    40,
    30,
    40,
    30,
    10,
    10,
    20,
    30,
    30,
    10,
    10,
    10,
    40,
    50,
    10,
    20,
    10,
    10,
    20,
    20,
    30,
    30,
    30,
    20,
    10,
    10,
    20,
    20,
    20
  ];

  var SM_J260F_Memory3 = [
    5,
    10,
    10,
    10,
    20,
    20,
    30,
    10,
    20,
    10,
    10,
    5,
    5,
    5,
    10,
    10,
    30,
    20,
    20,
    20,
    20,
    10,
    10,
    20,
    20,
    20,
    20,
    10,
    10,
    10,
    15,
    15,
    15,
    14,
    13,
    14,
    15,
    10,
    10,
    10,
    20,
    20,
    20,
    10,
    30,
    20,
    202,
    20,
    20
  ];

  var SM_J260F_Battery4 = [
    10,
    5,
    10,
    5,
    20,
    20,
    10,
    10,
    5,
    10,
    10,
    30,
    20,
    10,
    5,
    10,
    10,
    10,
    40,
    30,
    50,
    30,
    20,
    20,
    20,
    10,
    30,
    40,
    50,
    20,
    20,
    10,
    101,
    10,
    30,
    20,
    20,
    10,
    20,
    10,
    20,
    30,
    40,
    30,
    20,
    10,
    10
  ];

  var SM_J260F_Memory4 = [
    10,
    20,
    20,
    20,
    10,
    10,
    10,
    20,
    5,
    10,
    1,
    3,
    5,
    10,
    10,
    10,
    10,
    20,
    20,
    20,
    10,
    40,
    30,
    40,
    30,
    10,
    10,
    20,
    30,
    30,
    10,
    10,
    10,
    40,
    50,
    10,
    20,
    10,
    10,
    20,
    20,
    30,
    30,
    30,
    20,
    10,
    10,
    20,
    20,
    20
  ];
  var SM_J260F_Battery5 = [
    10,
    20,
    20,
    20,
    10,
    10,
    10,
    20,
    5,
    10,
    1,
    3,
    5,
    10,
    10,
    10,
    10,
    20,
    20,
    20,
    10,
    40,
    30,
    40,
    30,
    10,
    10,
    20,
    30,
    30,
    10,
    10,
    10,
    40,
    50,
    10,
    20,
    10,
    10,
    20,
    20,
    30,
    30,
    30,
    20,
    10,
    10,
    20,
    20,
    20
  ];

  var SM_J260F_Memory5 = [
    5,
    10,
    10,
    20,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    10,
    5,
    5,
    5,
    10,
    20,
    25,
    10,
    20,
    25,
    10,
    5,
    5,
    20,
    20,
    20,
    20,
    10,
    5,
    5,
    5,
    10,
    20,
    25,
    10,
    10,
    20,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    5,
    10,
    5,
    5,
    5,
    10,
    20,
    25
  ];

  var name;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Figma Flutter Generator Diagose1Widget - FRAME

    Widget placementContainer(String name, double width1) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Advent Pro',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  height: 1),
            ),
          ),
          Container(
            height: height * 0.005,
            width: width * width1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                )
              ],
              color: Colors.white,
            ),
          )
        ],
      );
    }

    Widget lettercounting(String title, String percentage) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Advent Pro',
                  fontSize: 12,
                  decoration: TextDecoration.none,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.w700,
                  height: 1),
            ),
          ),
          Text(
            percentage,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: const Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Advent Pro',
                fontSize: 12,
                decoration: TextDecoration.none,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        ],
      );
    }

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(29, 191, 115, 1),
                Color.fromRGBO(0, 172, 238, 1)
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.08,
              ),
              const Text(
                '4/8',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  decoration: TextDecoration.none,
                  letterSpacing: -0.3333333432674408,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/vector.svg',
                      semanticsLabel: 'vector'),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Container(
                    width: width * 0.7,
                    child: LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: Colors.white.withOpacity(0.5),
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.06,
              ),
              const Text(
                'Stress Test',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Roboto',
                    fontSize: 33,
                    decoration: TextDecoration.none,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Text(
                'All mothion test',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Advent Pro',
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              FutureBuilder<List<AppInfo>>(
                future: InstalledApps.getInstalledApps(true, true),
                builder: (BuildContext buildContext,
                    AsyncSnapshot<List<AppInfo>> snapshot) {
                  return snapshot.connectionState == ConnectionState.done
                      ? snapshot.hasData
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                AppInfo app = snapshot.data![index];
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    name.toString().startsWith("A") ||
                                            name.toString().startsWith("a") ||
                                            name.toString().startsWith("C") ||
                                            name.toString().startsWith("c") ||
                                            name.toString().startsWith("g") ||
                                            name.toString().startsWith("G") ||
                                            name.toString().startsWith("S") ||
                                            name.toString().startsWith("s") ||
                                            name.toString().startsWith("R") ||
                                            name.toString().startsWith("r")
                                        ? Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: placementContainer(
                                                    app.name!, 0.27),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: lettercounting(
                                                    "CPU",
                                                    SM_J260F_Memory[index]
                                                            .toString() +
                                                        "%"),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: lettercounting(
                                                    "Battery",
                                                    SM_J260F_Battery[index]
                                                            .toString() +
                                                        "%"),
                                              ),
                                            ],
                                          )
                                        : name.toString().startsWith("B") ||
                                                name
                                                    .toString()
                                                    .startsWith("b") ||
                                                name
                                                    .toString()
                                                    .startsWith("D") ||
                                                name
                                                    .toString()
                                                    .startsWith("d") ||
                                                name
                                                    .toString()
                                                    .startsWith("e") ||
                                                name
                                                    .toString()
                                                    .startsWith("E") ||
                                                name
                                                    .toString()
                                                    .startsWith("T") ||
                                                name
                                                    .toString()
                                                    .startsWith("t") ||
                                                name
                                                    .toString()
                                                    .startsWith("P") ||
                                                name.toString().startsWith("p")
                                            ? Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: placementContainer(
                                                        app.name!, 0.27),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: lettercounting(
                                                        "CPU",
                                                        SM_J260F_Memory1[index]
                                                                .toString() +
                                                            "%"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: lettercounting(
                                                        "Battery",
                                                        SM_J260F_Battery1[index]
                                                                .toString() +
                                                            "%"),
                                                  ),
                                                ],
                                              )
                                            : name.toString().startsWith("F") ||
                                                    name
                                                        .toString()
                                                        .startsWith("f") ||
                                                    name
                                                        .toString()
                                                        .startsWith("M") ||
                                                    name
                                                        .toString()
                                                        .startsWith("m") ||
                                                    name
                                                        .toString()
                                                        .startsWith("N") ||
                                                    name
                                                        .toString()
                                                        .startsWith("n") ||
                                                    name
                                                        .toString()
                                                        .startsWith("O") ||
                                                    name
                                                        .toString()
                                                        .startsWith("o") ||
                                                    name
                                                        .toString()
                                                        .startsWith("X") ||
                                                    name
                                                        .toString()
                                                        .startsWith("x")
                                                ? Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child:
                                                            placementContainer(
                                                                app.name!,
                                                                0.27),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: lettercounting(
                                                            "CPU",
                                                            SM_J260F_Memory2[
                                                                        index]
                                                                    .toString() +
                                                                "%"),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: lettercounting(
                                                            "Battery",
                                                            SM_J260F_Battery2[
                                                                        index]
                                                                    .toString() +
                                                                "%"),
                                                      ),
                                                    ],
                                                  )
                                                : name.toString().startsWith("J") ||
                                                        name
                                                            .toString()
                                                            .startsWith("j") ||
                                                        name
                                                            .toString()
                                                            .startsWith("L") ||
                                                        name
                                                            .toString()
                                                            .startsWith("l") ||
                                                        name
                                                            .toString()
                                                            .startsWith("Q") ||
                                                        name
                                                            .toString()
                                                            .startsWith("q") ||
                                                        name
                                                            .toString()
                                                            .startsWith("H") ||
                                                        name
                                                            .toString()
                                                            .startsWith("h") ||
                                                        name
                                                            .toString()
                                                            .startsWith("I") ||
                                                        name
                                                            .toString()
                                                            .startsWith("i")
                                                    ? Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                placementContainer(
                                                                    app.name!,
                                                                    0.27),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: lettercounting(
                                                                "CPU",
                                                                SM_J260F_Memory3[
                                                                            index]
                                                                        .toString() +
                                                                    "%"),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: lettercounting(
                                                                "Battery",
                                                                SM_J260F_Battery3[
                                                                            index]
                                                                        .toString() +
                                                                    "%"),
                                                          ),
                                                        ],
                                                      )
                                                    : name.toString().startsWith("K") ||
                                                            name.toString().startsWith(
                                                                "k") ||
                                                            name
                                                                .toString()
                                                                .startsWith(
                                                                    "V") ||
                                                            name
                                                                .toString()
                                                                .startsWith(
                                                                    "v") ||
                                                            name
                                                                .toString()
                                                                .startsWith(
                                                                    "U") ||
                                                            name
                                                                .toString()
                                                                .startsWith(
                                                                    "u") ||
                                                            name
                                                                .toString()
                                                                .startsWith(
                                                                    "W") ||
                                                            name
                                                                .toString()
                                                                .startsWith("w") ||
                                                            name.toString().startsWith("y") ||
                                                            name.toString().startsWith("Y") ||
                                                            name.toString().startsWith("Z") ||
                                                            name.toString().startsWith("z")
                                                        ? Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    placementContainer(
                                                                        app.name!,
                                                                        0.27),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: lettercounting(
                                                                    "CPU",
                                                                    SM_J260F_Memory4[index]
                                                                            .toString() +
                                                                        "%"),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: lettercounting(
                                                                    "Battery",
                                                                    SM_J260F_Battery4[index]
                                                                            .toString() +
                                                                        "%"),
                                                              ),
                                                            ],
                                                          )
                                                        : Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child:
                                                                    placementContainer(
                                                                        app.name!,
                                                                        0.27),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: lettercounting(
                                                                    "CPU",
                                                                    SM_J260F_Memory5[index]
                                                                            .toString() +
                                                                        "%"),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: lettercounting(
                                                                    "Battery",
                                                                    SM_J260F_Battery5[index]
                                                                            .toString() +
                                                                        "%"),
                                                              ),
                                                            ],
                                                          )
                                  ],
                                );
                              },
                            )
                          : const Center(
                              child: Text(
                                  "Error occurred while getting installed apps ...."))
                      : const Center(
                          child: const Text(
                          "Getting installed apps ....",
                          style: const TextStyle(color: Colors.white),
                        ));
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: placementContainer("Application 1", 0.27),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: lettercounting("CPU", "5%"),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: lettercounting("Battery", "10%"),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: placementContainer("Application 2", 0.27),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: lettercounting("CPU", "5%"),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: lettercounting("Battery", "10%"),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: placementContainer("Application 3", 0.27),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: lettercounting("CPU", "5%"),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: lettercounting("Battery", "10%"),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: placementContainer("Application 4", 0.27),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: lettercounting("CPU", "5%"),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: lettercounting("Battery", "10%"),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: height * 0.2,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 0),
                child: SizedBox(
                  width: width * 0.6,
                  height: height * 0.07,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      primary: Colors.white,
                      elevation: 6,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            reverseDuration: const Duration(seconds: 1),
                            duration: const Duration(seconds: 1),
                            child: const OriginalityTestHT()),
                      );
                    },
                    child: const Text(
                      "Ok",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: 'Advent Pro',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
