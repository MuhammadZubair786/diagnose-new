import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:diagnose/pages/quick_test_screens/wifi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:open_settings/open_settings.dart';

import 'gps.dart';

class WifiHT extends StatefulWidget {
  const WifiHT({Key? key}) : super(key: key);
  @override
  State<WifiHT> createState() => _WifiHTState();
}

class _WifiHTState extends State<WifiHT> {
  @override

  void initState(){
    super.initState();
  //  Timer.periodic(Duration(seconds: 3), (timer) { 
     CheckWifi();
  //  });


  }
   CheckWifi() async {
    var result = await Connectivity().checkConnectivity();
    showConnectivitySnackBar(result);
  }

  var showok = false;
  

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result == ConnectivityResult.wifi;
    // print(hasInternet);
    setState(() {
      showok = hasInternet;
    });
    // break;
  }

  void opensetting() async {
    await OpenSettings.openWIFISetting();
    // CheckWifi();
  }

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
            height: height * 0.06,
          ),
          Container(
            width: width * 0.6,
            height: height * 0.27,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Gif/wifi.gif'), fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const Text(
            'Wifi',
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
         showok ?  const Text(
            'Wifi Connected Successfully',
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
          ):
          const Text(
            ' Let Connected Wifi',
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
            height: height * 0.19,
          ),
          showok == false
              ? Padding(
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
                        opensetting();
                        // Navigator.push(
                        //   context,
                        //   PageTransition(
                        //     type: PageTransitionType.fade,
                        //     reverseDuration: const Duration(seconds: 1),
                        //     duration: const Duration(seconds: 1),
                        //     child: const Opensetting(),
                        //   ),
                        // );
                      },
                      child: const Text(
                        "Go to Setting",
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
                )
              :
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     width: width * 0.6,
              //     height: height * 0.07,
              //     child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(5),
              //         ),
              //         primary: Colors.white,
              //         elevation: 6,
              //       ),
              //       onPressed: () {
              //         // opensetting();
              //         // Navigator.push(
              //         //   context,
              //         //   PageTransition(
              //         //     type: PageTransitionType.fade,
              //         //     reverseDuration: const Duration(seconds: 1),
              //         //     duration: const Duration(seconds: 1),
              //         //     child: const Opensetting(),
              //         //   ),
              //         // );
              //       },
              //       child: const

              //        Text(
              //         "Ok",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           letterSpacing: 2,
              //           fontWeight: FontWeight.w700,
              //           fontSize: 25,
              //           color: Colors.black,
              //           fontFamily: 'Advent Pro',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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
                        // opensetting();
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            reverseDuration: const Duration(seconds: 1),
                            duration: const Duration(seconds: 1),
                            child: const GpsHT(),
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
                    ),
                  ),
                ),
          SizedBox(
            height: height * 0.005,
          ),
          projectWidget()
        ],
      ),
    );
  }

  Widget projectWidget() {
    return FutureBuilder(
        future: CheckWifi(),
        builder: (context, projectSnap) {
          return Text("");
        });
  }
}
