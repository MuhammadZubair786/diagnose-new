import 'dart:async';

import 'package:diagnose/pages/full_test_screens/hardware_testft/hardware_test_ht.dart';
import 'package:diagnose/pages/quick_test_screens/speaker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:math' as math;

import 'package:all_sensors/all_sensors.dart';
// import 'package:shake/shake.dart';

class JustShakeMT extends StatefulWidget {
  const JustShakeMT({Key? key}) : super(key: key);

  @override
  State<JustShakeMT> createState() => _JustShakeMTState();
}

class _JustShakeMTState extends State<JustShakeMT> {

    List<double> _accelerometerValues = <double>[];
  List<double> _userAccelerometerValues = <double>[];
  List<double> _gyroscopeValues = <double>[];
  bool _proximityValues = false;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];


      @override
  void dispose() {
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();

    // ShakeDetector detector = ShakeDetector.autoStart(
    //   onPhoneShake: () {
    //     ScaffoldMessenger.of(context)
    //         .showSnackBar(SnackBar(content: Text('Shake!')));
    //     // Do stuff on phone shake
    //   },
    //   minimumShakeCount: 1,
    //   shakeSlopTimeMS: 500,
    //   shakeCountResetTime: 3000,
    //   shakeThresholdGravity: 2.7,
    // );

    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  


    _streamSubscriptions
        .add(accelerometerEvents!.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
    _streamSubscriptions.add(gyroscopeEvents!.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    }));

    _streamSubscriptions
        .add(userAccelerometerEvents!.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
    _streamSubscriptions.add(proximityEvents!.listen((ProximityEvent event) {
      setState(() {
        _proximityValues = event.getValue();
      });
    }));
  }


  @override
  Widget build(BuildContext context) {

         final List<String> accelerometer =
        _accelerometerValues.map((double v) => v.toStringAsFixed(1)).toList();
    final List<String> gyroscope =
        _gyroscopeValues.map((double v) => v.toStringAsFixed(1)).toList();
    final List<String> userAccelerometer = _userAccelerometerValues
        .map((double v) => v.toStringAsFixed(1))
        .toList();

        
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Figma Flutter Generator Diagose1Widget - FRAME

    //
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
                  wordSpacing: 20,
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
                const Color.fromRGBO(29, 191, 115, 1),
                Color.fromRGBO(0, 172, 238, 1)
              ]),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.08,
            ),
            const Text(
              '3/8',
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
                    value: 0.4,
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
              width: width * 0.6,
              height: height * 0.25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/shake-phone-icon-19-removebg-preview.png'),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Text(
              'Just shake',
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
            SizedBox(
              height: height * 0.01,
            ),
            const Text(
              'All mothion test',
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
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: placementContainer("Accelerometer", 0.3),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: lettercounting("x", "${accelerometer[0].toString()}"),
                ),
                Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: lettercounting("y", "${accelerometer[1].toString()}"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: lettercounting("z", "${accelerometer[2].toString()}"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 9,
                    top: 8,
                    right: 39,
                    bottom: 8,
                  ),
                  child: placementContainer("Garoscope", 0.21),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: lettercounting("x", "312.93823"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: lettercounting("y", "312.93823"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: lettercounting("z", "312.93823"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 8,
                    right: 58,
                    bottom: 8,
                  ),
                  child: placementContainer("Location", 0.17),
                ),
                const Padding(
                    padding: EdgeInsets.all(4),
                    child: const Text(
                      'N',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Advent Pro',
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w700,
                          height: 1),
                    )),
                SizedBox(
                  width: width * 0.08,
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Stack(
                    children: [
                      const Text(
                        'E',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Advent Pro',
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w700,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.1,
                ),
                const Padding(
                    padding: EdgeInsets.all(4),
                    child: const Text(
                      'W',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Advent Pro',
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w700,
                          height: 1),
                    )),
                SizedBox(
                  width: width * 0.1,
                ),
                const Padding(
                    padding: EdgeInsets.all(4),
                    child: const Text(
                      'S',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Advent Pro',
                          fontSize: 12,
                          decoration: TextDecoration.none,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w700,
                          height: 1),
                    )),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width * 0.7,
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
                        type: PageTransitionType.fade,
                        reverseDuration: const Duration(seconds: 1),
                        duration: const Duration(seconds: 1),
                        child: const HardwareTestFT(),
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
          ],
        ),
      ),
    );
  }
}
