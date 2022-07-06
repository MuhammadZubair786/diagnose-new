// import 'package:camera/camera.dart';
import 'package:camera/camera.dart';
import 'package:diagnose/pages/quick_test_screens/back_camera_open.dart';
import 'package:diagnose/pages/quick_test_screens/front_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';


class FrontCameraOpen extends StatefulWidget {
  const FrontCameraOpen({Key? key}) : super(key: key);

  @override
  State<FrontCameraOpen> createState() => _FrontCameraOpenState();
}

class _FrontCameraOpenState extends State<FrontCameraOpen> {



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
            '8/8',
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
                  value: 1,
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
            width: width * 0.35,
            height: height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Gif/frontCame.gif'),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const Text(
            'Front Camera',
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
          const Text(
            'Keep the front-facing comera pointed\nat yourself until test is complete',
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
            height: height * 0.17,
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
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     PageTransition(
                //       type: PageTransitionType.fade,
                //       reverseDuration: const Duration(seconds: 1),
                //       duration: const Duration(seconds: 1),
                //       child: const FrontCamera(),
                //     ),
                //   );
                // },
                onPressed: () async {
            await availableCameras().then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FrontCamera(cameras: value,),
                ),
              ),
            );
          },
                child: const Text(
                  "Open",
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
                context,
                MaterialPageRoute(
                  builder: (context) => BackCameraOpne(),
                ),
              );
            },
            child: const Text(
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
