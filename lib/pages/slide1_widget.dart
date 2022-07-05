import 'package:diagnose/navbar/navb.dart';
import 'package:diagnose/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Slide1Widget extends StatefulWidget {
  const Slide1Widget({Key? key}) : super(key: key);

  @override
  _Slide1WidgetState createState() => _Slide1WidgetState();
}

class _Slide1WidgetState extends State<Slide1Widget> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Figma Flutter Generator Slide1Widget - FRAME

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                    'assets/HD-wallpaper-settings-clock-gear-mechanic.jpg'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8),
                  BlendMode.hardLight,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 60),
            child: Container(
              height: height * 0.85,
              width: width * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.4,
                  ),
                  const Text(
                    'All Discription like what i need ti access ',
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Advent Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1),
                  ),
                  SizedBox(
                    height: height * 0.2,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: height * 0.035,
                        width: width * 0.06,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1DBF73),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      const Text(
                        'Agree on terms and conditions',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(170, 170, 170, 1),
                            fontFamily: 'Advent Pro',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1,
                            ),
                      ),
                    ],
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
                            side:
                                const BorderSide(width: 2, color:  Color(0XFF1DBF73),),),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              reverseDuration: const Duration(seconds: 1),
                              duration: const Duration(seconds: 1),
                              child: const  BottomNavbar(),
                            ),
                          );
                        },
                        child: const Text(
                          "Accept",
                          textAlign: TextAlign.center,
                          style:  TextStyle(
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 60),
            child: Container(
              height: height * 0.2,
              width: width * 0.8,
              decoration: const BoxDecoration(
                gradient:  LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0XFF1DBF73),
                     Color(0XFF00ACEE),
                  ],
                ),
                borderRadius:  BorderRadius.only(
                  topLeft:  Radius.circular(15),
                  topRight:  Radius.circular(15),
                  bottomRight:  Radius.elliptical(250, 70),
                  bottomLeft:  Radius.elliptical(250, 70),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     const Text(
                      'Access',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:  Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Roboto',
                        fontSize: 38,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                     const Text(
                      'Your data will on safe hand',
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Advent Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}