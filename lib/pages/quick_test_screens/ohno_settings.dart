import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:diagnose/pages/quick_test_screens/speaker.dart';
import 'package:diagnose/pages/quick_test_screens/success_wifi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_settings/open_settings.dart';
import 'package:page_transition/page_transition.dart';

import 'wifi.dart';

class OhnoSettings extends StatefulWidget {
  const OhnoSettings({Key? key}) : super(key: key);

  @override
  State<OhnoSettings> createState() => _OhnoSettingsState();
}

class _OhnoSettingsState extends State<OhnoSettings> {

  var chkwifi;
  @override
  void initState() {
    super.initState();
  
  }
  



   CheckWifi() async {
    var result = await Connectivity().checkConnectivity();
    showConnectivitySnackBar(result);
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result == ConnectivityResult.wifi;
    print(hasInternet);
    setState(() {
      chkwifi=hasInternet;
    });

    if (hasInternet == true) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Wifi(),
          ),
        );
      });
    }
   
  }


   opensetting()async {
  await   OpenSettings.openWIFISetting();
    CheckWifi();
 
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Figma Flutter Generator Diagose1Widget - FRAME
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(29, 191, 115, 1),
              Color.fromRGBO(0, 172, 238, 1)
            ]),
      ),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.08,
          ),
          Text(
            '6/8',
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
                width: width * 0.7,
                child: LinearProgressIndicator(
                  value: 0.6,
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
            decoration: BoxDecoration(
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
          Text(
            'Oh, no1!',
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
          Text(
            'Wifi is not connecting please go to\nthe mobile settings',
            textAlign: TextAlign.center,
            style: TextStyle(
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
                  opensetting();
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //     type: PageTransitionType.rightToLeft,
                  //     reverseDuration: const Duration(seconds: 1),
                  //     duration: const Duration(seconds: 1),
                  //     child: const Wifi(),
                  //   ),
                  // );
                },
                child: const Text(
                  "Settings",
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
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Speaker()));
            },
            child: Text(
              'Skip',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Advent Pro',
                  fontSize: 25,
                  decoration: TextDecoration.none,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
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
