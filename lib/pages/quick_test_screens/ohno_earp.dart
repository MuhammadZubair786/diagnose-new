import 'dart:async';

import 'package:diagnose/pages/full_test_screens/connectivity_test_ft/wifi.dart';
import 'package:diagnose/pages/quick_test_screens/earpiece.dart';
import 'package:diagnose/pages/quick_test_screens/ohno_settings.dart';
import 'package:diagnose/pages/quick_test_screens/success_wifi.dart';
import 'package:diagnose/pages/quick_test_screens/wifi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class OhnoEarPiece extends StatefulWidget {
  const OhnoEarPiece({Key? key}) : super(key: key);

  @override
  State<OhnoEarPiece> createState() => _OhnoEarPieceState();
}

class _OhnoEarPieceState extends State<OhnoEarPiece> {
  Future<void> CheckWifi() async {
    var result = await Connectivity().checkConnectivity();
    showConnectivitySnackBar(result);
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result == ConnectivityResult.wifi;
    print(hasInternet);

    Timer(Duration(seconds: 3), () {
      if(hasInternet==false){
     Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      reverseDuration: const Duration(seconds: 1),
                      duration: const Duration(seconds: 1),
                      child: const OhnoSettings(),
                    ),
                  );
      }
        if(hasInternet==true){
      Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      reverseDuration: const Duration(seconds: 1),
                      duration: const Duration(seconds: 1),
                      child: const Wifi(),
                    ),
                  );
      }
    });

    // message = hasInternet
    //     ? 'SuccessFully Wife Connected'
    //     : 'Check Wifi  ';
    // final color = hasInternet ? Colors.green : Colors.red;
    // setState(() {
    //   message = message;
    // });
    // print(message);
    // }
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
            '5/8',
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
              SvgPicture.asset('assets/vector.svg', semanticsLabel: 'vector'),
              SizedBox(
                width: width * 0.04,
              ),
              Container(
                width: width * 0.7,
                child: LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.15,
          ),
          Container(
            width: width * 0.24,
            height: height * 0.12,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/cross.gif',
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          const Text(
            'Oh, no!',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 35,
                decoration: TextDecoration.none,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
          const Text(
            'Make sure no Earpiece or\n any  other audio connected with your \nphone.',
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
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      reverseDuration: const Duration(seconds: 1),
                      duration: const Duration(seconds: 1),
                      child: const EarPiece(),
                    ),
                  );
                },
                child: const Text(
                  "Try Again",
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
          GestureDetector(
            onTap: () {
              CheckWifi() ;
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const OhnoSettings(),
              //   ),
              // );
            },
            child: const Text(
              'Skip',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Advent Pro',
                  fontSize: 25,
                  decoration: TextDecoration.none,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          )
        ],
      ),
    );
  }
}
