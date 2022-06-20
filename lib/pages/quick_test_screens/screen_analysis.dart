import 'package:diagnose/pages/quick_test_screens/microphone.dart';
import 'package:diagnose/pages/quick_test_screens/mobile.dart';
import 'package:diagnose/pages/quick_test_screens/mobilefull.dart';
import 'package:diagnose/pages/quick_test_screens/ohno_microphone.dart';
import 'package:diagnose/pages/quick_test_screens/touch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class ScreenAnalysis extends StatefulWidget {
  const ScreenAnalysis({Key? key}) : super(key: key);

  @override
  State<ScreenAnalysis> createState() => _ScreenAnalysisState();
}

class _ScreenAnalysisState extends State<ScreenAnalysis> {
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
                  value: 0.3,
                  backgroundColor: Colors.white.withOpacity(0.5),
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Stack(
            children: [
              Container(
                width: width * 0.6,
                height: height * 0.3,
                decoration: const BoxDecoration(
                  image: const DecorationImage(
                      image: const AssetImage('assets/Gif/mobile.gif'),
                      fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 65, top: 20),
                child: Container(
                  width: width * 0.2,
                  height: height * 0.2,
                  decoration: const BoxDecoration(
                    image: const DecorationImage(
                        image: const AssetImage('assets/Gif/Cracked.gif'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const Text(
            'Screen Analysis',
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
            height: height * 0.008,
          ),
          const Text(
            'This test check your screen  sensitivity\n and working.',
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
            height: height * 0.2,
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
                        type: PageTransitionType.topToBottom,
                        reverseDuration: const Duration(microseconds: 1),
                        duration: const Duration(microseconds: 1),
                        child: SimpleDialog(
                          insetPadding: const EdgeInsets.all(100),
                          children: [
                            Container(
                              height: height * 0.1,
                              width: width * 0.2,
                              child: Column(
                                children: [
                                  const Text(
                                    "Screen cracked ?",
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              reverseDuration:
                                                  const Duration(seconds: 1),
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              child: const MobileFullScreenQT(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "Yes",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'Advent Pro',
                                              fontSize: 25,
                                              decoration: TextDecoration.none,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.06,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .leftToRight,
                                              reverseDuration:
                                                  const Duration(seconds: 1),
                                              duration:
                                                  const Duration(seconds: 1),
                                              child: const Screentouch(),
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "No",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontFamily: 'Advent Pro',
                                              fontSize: 25,
                                              decoration: TextDecoration.none,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  );
                },
                child: const Text(
                  "Start",
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>Microphone(),),);
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
