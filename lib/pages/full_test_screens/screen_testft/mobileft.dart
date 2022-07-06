
import 'package:diagnose/pages/full_test_screens/screen_testft/BoxesFt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class MobilepercentFT extends StatefulWidget {
  const MobilepercentFT({Key? key}) : super(key: key);

  @override
  State<MobilepercentFT> createState() => _MobilepercentFTState();
}

class _MobilepercentFTState extends State<MobilepercentFT> {
   var box1=true;
    var box2=true;
    var box3=true;
    var box4=true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Figma Flutter Generator Diagose1Widget - FRAME

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
                    value: 0.3,
                    backgroundColor: Colors.white.withOpacity(0.5),
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: width * 0.64,
              height: height * 0.66,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 35, left: 20),
                    child: Row(
                      children: [
                       
                         Container(
                          height: height * 0.25,
                          width: width * 0.25,
                          padding: EdgeInsets.only(top: 10, left: 10),
                          //  margin: EdgeInsets.all(40),
                          child:   Center(child: Text("25%"))
                        ),
                        // \:
                        // Container(
                        //   height: height * 0.25,
                        //   width: width * 0.25,
                        //   padding: EdgeInsets.only(top: 10, left: 10),
                        //   //  margin: EdgeInsets.all(40),
                        //   child:   Center(child: Text("0%"))
                        // ),
                     Container(
                          height: height * 0.25,
                          width: width * 0.25,
                          padding: EdgeInsets.only(top: 10, left: 10),
                          //  margin: EdgeInsets.all(40),
                          child:   Center(child: Text("25%"))
                        )
                        
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 20),
                    child: Row(
                      children: [
                     Container(
                          height: height * 0.25,
                          width: width * 0.25,
                          padding: EdgeInsets.only(top: 10, left: 10),
                          //  margin: EdgeInsets.all(40),
                          child:   Center(child: Text("25%"))
                        ),
                      
                          Container(
                          height: height * 0.25,
                          width: width * 0.25,
                          padding: EdgeInsets.only(top: 10, left: 10),
                          //  margin: EdgeInsets.all(40),
                          child:   Center(child: Text("25%"))
                        )
                        // :
                        // Container(
                        //   height: height * 0.25,
                        //   width: width * 0.25,
                        //   padding: EdgeInsets.only(top: 10, left: 10),
                        //   //  margin: EdgeInsets.all(40),
                        //   child:   Center(child: Text("0%"))
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/screen.png',
                    ),
                    fit: BoxFit.fill),
              ),
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
                          child: BoxesFT()),
                    );
                  },
                  child: const Text(
                    "Okay",
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
              // onTap: () {
              //   Navigator.pushReplacement(context,
              //       MaterialPageRoute(builder: (context) => const ScreenAnalysis(),),);
              // },
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
      ),
    );
  }
}
