import 'package:diagnose/pages/full_test_screens/camera_test_ft/camera_test_cmt.dart';
import 'package:diagnose/pages/full_test_screens/connectivity_test_ft/connectivity_test_ct.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/hardware_test_ht.dart';
import 'package:diagnose/pages/full_test_screens/motion_testst/just_shake_mt.dart';
import 'package:diagnose/pages/full_test_screens/screen_testft/screen_test.dart';
import 'package:diagnose/pages/full_test_screens/sound_testft/sound_test_st.dart';
import 'package:diagnose/pages/full_test_screens/sound_testft/speaker_st.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';


class MotionTestST extends StatefulWidget {
  const MotionTestST({Key? key}) : super(key: key);

  @override
  State<MotionTestST> createState() => _MotionTestSTState();
}

class _MotionTestSTState extends State<MotionTestST> {

 


  @override
  Widget build(BuildContext context) {

 


  


    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Figma Flutter Generator Diagose1Widget - FRAME
    Widget iconContainer(String image, String name) {
      return Column(
        children: [
          Container(
            height: height * 0.074,
            width: width * 0.15,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                image,
                height: height * 0.05,
                width: width * 0.08,
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 2,
                )
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            name,
            style: const TextStyle(
              fontFamily: "Advent Pro",
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: Container(
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
              '3/6',
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

// =======================================
//    main 6 Container
// ======================================
            Padding(
              padding: const EdgeInsets.only(left: 39, top: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullTest(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: iconContainer(
                          "assets/Screenresolution.png", "Screen"),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.176,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SountTestST(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: iconContainer("assets/Sound.png", "Sound"),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.176,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.074,
                          width: width * 0.15,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              "assets/Circuit.png",
                              height: height * 0.05,
                              width: width * 0.08,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 2,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          "Motion",
                          style: const TextStyle(
                            fontFamily: "Advent Pro",
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Container(
                          height: height * 0.002,
                          width: width * 0.13,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              color: Colors.grey,
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 39, top: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HardwareTestFT(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child:
                          iconContainer("assets/Smartphoneram.png", "Hardware"),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConnectivityTest(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: iconContainer(
                          "assets/Computersconnecting.png", "Connectivity"),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CameraTest(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: iconContainer("assets/Camera.png", "Camera"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.14,
            ),

            Text(
              'Full Test',
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
              height: height * 0.02,
            ),
            Text(
              'Just follow the instructions to test your\ndevice',
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
              height: height * 0.1,
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
                        type: PageTransitionType.fade,
                        reverseDuration: const Duration(seconds: 1),
                        duration: const Duration(seconds: 1),
                        child: JustShakeMT(),
                      ),
                    );
                  },
                  child: const Text(
                    "Motion Test",
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
