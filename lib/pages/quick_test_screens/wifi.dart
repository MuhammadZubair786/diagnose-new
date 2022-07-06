import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:diagnose/pages/quick_test_screens/speaker.dart';
import 'package:diagnose/pages/quick_test_screens/succes_wifi_connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_settings/open_settings.dart';
import 'package:page_transition/page_transition.dart';

class Wifi extends StatefulWidget {
  const Wifi({Key? key}) : super(key: key);

  @override
  State<Wifi> createState() => _WifiState();
}

class _WifiState extends State<Wifi> { 
  Future<void> CheckWifi() async {
    var result = await Connectivity().checkConnectivity();
    showConnectivitySnackBar(result);
  }

   var showok=false;

   void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result == ConnectivityResult.wifi;
    // print(hasInternet);
    setState(() {
     showok= hasInternet;
    });

   
    
      if (hasInternet == true) {
        print("Suceessfully connect wifi");
        // Navigator.push(
        //   context,
        //   PageTransition(
        //     type: PageTransitionType.rightToLeft,
        //     reverseDuration: const Duration(seconds: 1),
        //     duration: const Duration(seconds: 1),
        //     child: const Wifi(),
        //   ),
        // );
      }
    
  }

    void opensetting()async {
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
            height: height * 0.1,
          ),
          Container(
            width: width * 0.6,
            height: height * 0.24,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/Gif/wifi.gif',
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          Text(
            'WiFi',
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
            'Connect your phone to a trusted wifi\nnetwork',
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
            height: height * 0.16,
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
                      child: const SuccesswifiConnect(),
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
          )
        ],
      ),
    );
  }
}
