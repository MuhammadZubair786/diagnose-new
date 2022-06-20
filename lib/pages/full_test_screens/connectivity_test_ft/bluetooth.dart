// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_settings/open_settings.dart';
import 'package:page_transition/page_transition.dart';

import 'wifi.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class Bluetooth extends StatefulWidget {
  const Bluetooth({Key? key}) : super(key: key);

  @override
  State<Bluetooth> createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  var bluetooth = BluetoothState.off.toString();

  void openSetting() {
    OpenSettings.openBluetoothSetting();
  }

  void setdata() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Figma Flutter Generator Diagose1Widget - FRAME
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(29, 191, 115, 1),
              const Color.fromRGBO(0, 172, 238, 1)
            ]),
      ),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.08,
          ),
          const Text(
            '5/6',
            textAlign: TextAlign.center,
            style: TextStyle(
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
              SvgPicture.asset('assets/vector.svg', semanticsLabel: 'vector'),
              SizedBox(
                width: width * 0.04,
              ),
              Container(
                width: width * 0.8,
                child: LinearProgressIndicator(
                  value: 0.8,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            width: width * 0.8,
            height: height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Gif/bluetooth.gif'),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const Text(
            'Bluetooth',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 35,
                decoration: TextDecoration.none,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Container(
            child: StreamBuilder<BluetoothState>(
                stream: FlutterBluePlus.instance.state,
                initialData: BluetoothState.unknown,
                builder: (c, snapshot) {
                  print(snapshot);
                  final state = snapshot.data;

                  if (state == BluetoothState.on) {
                    //     setState(() {
                    //   bluetooth=BluetoothState.on.toString();
                    // });
                    return Column(children: [
                      Text(
                        'Bluethooth On',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Advent Pro',
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                  // openSetting();
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      reverseDuration: const Duration(seconds: 1),
                                      duration: const Duration(seconds: 1),
                                      child: const WifiHT(),
                                    ),
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
                              )))
                    ]);
                  }
                  return Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Lets connect Bluetooth',
                          textAlign: TextAlign.center,
                          // ignore: unnecessary_const
                          style: const TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'Advent Pro',
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                    openSetting();
                                    // Navigator.push(
                                    //   context,
                                    //   PageTransition(
                                    //     type: PageTransitionType.fade,
                                    //     reverseDuration: const Duration(seconds: 1),
                                    //     duration: const Duration(seconds: 1),
                                    //     child: const WifiHT(),
                                    //   ),
                                    // );
                                  },
                                  child: const Text(
                                    "GO To Setting",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontFamily: 'Advent Pro',
                                    ),
                                  ),
                                )))
                      ]);
                }),
          ),
          // const Text(
          //   'Lets connect Bluetooth',
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(
          //       color: Color.fromRGBO(255, 255, 255, 1),
          //       fontFamily: 'Advent Pro',
          //       fontSize: 16,
          //       decoration: TextDecoration.none,
          //       letterSpacing:
          //           0 /*percentages not used in flutter. defaulting to zero*/,
          //       fontWeight: FontWeight.normal,
          //       height: 1),
          // ),
          SizedBox(
            height: height * 0.17,
          ),
          ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  primary: Colors.white,
                                  elevation: 6,
                                ),
                                onPressed: () {
                                  // openSetting();
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      reverseDuration: const Duration(seconds: 1),
                                      duration: const Duration(seconds: 1),
                                      child: const WifiHT(),
                                    ),
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
                              )]));
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: SizedBox(
          //       width: width * 0.6,
          //       height: height * 0.07,
          //       child:ElevatedButton(
          //               style: ElevatedButton.styleFrom(
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(5),
          //                 ),
          //                 primary: Colors.white,
          //                 elevation: 6,
          //               ),
          //               onPressed: () {
          //                 openSetting();
          //                 // Navigator.push(
          //                 //   context,
          //                 //   PageTransition(
          //                 //     type: PageTransitionType.fade,
          //                 //     reverseDuration: const Duration(seconds: 1),
          //                 //     duration: const Duration(seconds: 1),
          //                 //     child: const WifiHT(),
          //                 //   ),
          //                 // );
          //               },
          //               child: const Text(
          //                 "Ok",
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                   letterSpacing: 2,
          //                   fontWeight: FontWeight.w700,
          //                   fontSize: 25,
          //                   color: Colors.black,
          //                   fontFamily: 'Advent Pro',
          //                 ),
          //               ),
          //             )
          //           : ElevatedButton(
          //               style: ElevatedButton.styleFrom(
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(5),
          //                 ),
          //                 primary: Colors.white,
          //                 elevation: 6,
          //               ),
          //               onPressed: () {
          //                 openSetting();
          //                 // Navigator.push(
          //                 //   context,
          //                 //   PageTransition(
          //                 //     type: PageTransitionType.fade,
          //                 //     reverseDuration: const Duration(seconds: 1),
          //                 //     duration: const Duration(seconds: 1),
          //                 //     child: const WifiHT(),
          //                 //   ),
          //                 // );
          //               },
          //               child: const Text(
          //                 "Go to Setting",
          //                 textAlign: TextAlign.center,
          //                 style: TextStyle(
          //                   letterSpacing: 2,
          //                   fontWeight: FontWeight.w700,
          //                   fontSize: 25,
          //                   color: Colors.black,
          //                   fontFamily: 'Advent Pro',
          //                 ),
          //               ),
          //             )),
          // ),
    //       SizedBox(
    //         height: height * 0.005,
    //       ),
    //     ],
    //   ),
    // );
  }
}
