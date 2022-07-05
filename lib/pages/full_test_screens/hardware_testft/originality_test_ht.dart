import 'package:diagnose/pages/full_test_screens/connectivity_test_ft/connectivity_test_ct.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/charging_test_ht.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class OriginalityTestHT extends StatefulWidget {
  const OriginalityTestHT({Key? key}) : super(key: key);

  @override
  State<OriginalityTestHT> createState() => _OriginalityTestHTState();
}

class _OriginalityTestHTState extends State<OriginalityTestHT> {
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

    Widget description(
      String name,
      String number,
      String status,
      Color color1,
    ) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 45),
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
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  height: 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text(
              number,
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
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  height: 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  color: color1,
                  // const Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Advent Pro',
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  height: 1),
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
              '4/8',
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
                    value: 0.5,
                    backgroundColor: Colors.white.withOpacity(0.5),
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Text(
              'Originality',
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
            Text(
              'All mothion test',
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
              height: height * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: placementContainer("Ic Name", 0.18),
                ),
                SizedBox(
                  width: width * 0.07,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: placementContainer("Number", 0.18),
                ),
                SizedBox(
                  width: width * 0.07,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: placementContainer("Status", 0.16),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: description(
                  "Name", "LDE121ANAJ", "Changed", Color(0xFFF83A3A)),
            ),
            SizedBox(
              width: width * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: description("Name", "LDE121ANAJ", "Orignal", Colors.white),
            ),
            SizedBox(
              width: width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: description("Name", "LDE121ANAJ", "Orignal", Colors.white),
            ),
            SizedBox(
              width: width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: description(
                  "Name", "LDE121ANAJ", "Changed", Color(0xFFF83A3A)),
            ),
            SizedBox(
              height: height * 0.25,
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
                          child: ConnectivityTest(),),
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
