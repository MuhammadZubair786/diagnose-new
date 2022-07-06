import 'package:diagnose/pages/selectwidget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
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
                  )),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 100),
                      child: Text(
                        "Introduction",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.07,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  reverseDuration: const Duration(seconds: 1),
                                  duration: const Duration(seconds: 1),
                                  child: const SelectWidget(),),);
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Advent Pro',
                              fontSize: 20,
                              letterSpacing: 0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                              height: 1.5),
                        ))
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: width * 0.8,
                                height: height * 0.8,
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * 0.23,
                                      width: width,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromRGBO(29, 191, 115, 1),
                                              Color.fromRGBO(0, 172, 238, 1)
                                            ]),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft:
                                              Radius.elliptical(200, 70),
                                          bottomRight:
                                              Radius.elliptical(200, 70),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: height * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 60.0,
                                                ),
                                                child: Container(
                                                    height: 55,
                                                    width: 55,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 10,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.7),
                                                            spreadRadius: 1)
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.elliptical(
                                                            60.11320877075195,
                                                            58.83271789550781),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image.asset(
                                                        "assets/Lcd.png",
                                                        width: 10,
                                                        height: 10,
                                                      ),
                                                    )),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 60.0, left: 20),
                                                child: Container(
                                                    height: 55,
                                                    width: 55,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 10,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.7),
                                                            spreadRadius: 1)
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius
                                                          .all(Radius.elliptical(
                                                              60.11320877075195,
                                                              58.83271789550781)),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image.asset(
                                                        "assets/Hearthealth.png",
                                                        width: width * 0.01,
                                                        height: height * 0.2,
                                                      ),
                                                    )),
                                              ),
                                              SizedBox(
                                                height: height * 0.01,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 60.0, left: 20),
                                                child: Container(
                                                    height: 55,
                                                    width: 55,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 10,
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.7),
                                                            spreadRadius: 1)
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius
                                                          .all(Radius.elliptical(
                                                              60.11320877075195,
                                                              58.8327789550781)),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image.asset(
                                                        "assets/kesv.png",
                                                        width: 10,
                                                        height: 10,
                                                      ),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 117.0),
                                      child: Text(
                                        "Welcome",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/Near_repair_Type_II-removebg-preview.png",
                                      width: 120,
                                      height: 80,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15.0),
                                      child: Text(
                                        "Check your phone’s health\n Create a complete status report\n Use it to dignose your mobile issues\n and we will repair.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Advent Pro",
                                            color: Colors.black54,
                                            fontSize: 15),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 80.0,
                                      ),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(0.3),
                                            child: Container(
                                              height: 6,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.07,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(0.3),
                                            child: Container(
                                              height: 6,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xfff5f5f5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.07,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(0.3),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xfff5f5f5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              height: 6,
                                              width: 25,
                                            ),
                                          ),
                                        ],
                                      )),
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 70, top: 130),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.1,
                                ),
                                Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.elliptical(60.11320877075195,
                                                58.83271789550781)),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 10,
                                              color:
                                                  Colors.grey.withOpacity(0.7),
                                              spreadRadius: 1)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/Services.png",
                                        width: 10,
                                        height: 10,
                                      ),
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0.0, left: 20),
                                  child: Container(
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.elliptical(
                                                  60.11320877075195,
                                                  58.83271789550781)),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10,
                                                color: Colors.grey
                                                    .withOpacity(0.7),
                                                spreadRadius: 1)
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/Downloadfromthecloud.png",
                                          width: 10,
                                          height: 10,
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0.0, left: 20),
                                  child: Container(
                                      height: 55,
                                      width: 55,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.elliptical(
                                                  60.11320877075195,
                                                  58.83271789550781)),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10,
                                                color: Colors.grey
                                                    .withOpacity(0.7),
                                                spreadRadius: 1)
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/Loadbalancer.png",
                                          width: 10,
                                          height: 10,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),),
                            width: width * 0.8,
                            height: height * 0.8,
                            child: Column(children: [
                              Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Container(
                                    height: height * 0.23,
                                    width: width,
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color.fromRGBO(29, 191, 115, 1),
                                            Color.fromRGBO(0, 172, 238, 1)
                                          ]),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.elliptical(200, 70),
                                        bottomRight: Radius.elliptical(200, 70),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 60),
                                    child: Image.asset(
                                      "assets/slode2.png",
                                      height: height * 0.25,
                                      width: width * 0.7,
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.only(left: 17.0, top: 44),
                                child: Text(
                                  "Check your phone’s health Create a\n complete status report. Use it free\n and make a health report  and\n send us, We will repair it",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Advent Pro",
                                      color: Colors.black54,
                                      fontSize: 15),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 190.0,
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0.3),
                                      child: Container(
                                        height: 6,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: const Color(0xfff5f5f5),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.07,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0.3),
                                      child: Container(
                                        height: 6,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.07,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0.3),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xfff5f5f5),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: 6,
                                        width: 25,
                                      ),
                                    ),
                                  ],
                                )),
                              )
                            ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30.0,
                          right: 30,
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            width: width * 0.8,
                            height: height * 0.8,
                            child: Column(children: [
                              Stack(
                               
                                children: [
                                  Container(
                                      height: height * 0.23,
                                      width: width,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color.fromRGBO(29, 191, 115, 1),
                                              Color.fromRGBO(0, 172, 238, 1)
                                            ]),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft:
                                              Radius.elliptical(200, 70),
                                          bottomRight:
                                              Radius.elliptical(200, 70),
                                        ),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                      )),
                                       Padding(
                                         padding: const EdgeInsets.only(top: 60),
                                         child: Image.asset(
                        "assets/mapi.png",
                      height: height * 0.25,
                          width: width * 2,
                      ),
                                       ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 44.0, left: 40.0, right: 20.0),
                                child: Text(
                                  "Comair quotes from the best device reqair shops in your area",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Advent Pro",
                                      color: Colors.black54,
                                      fontSize: 15),
                                ),
                              ),
                              SizedBox(height: height * 0.15),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type:
                                            PageTransitionType.rightToLeft,
                                        reverseDuration:
                                            const Duration(seconds: 1),
                                        duration:
                                            const Duration(seconds: 1),
                                        child: const SelectWidget(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: height * 0.055,
                                    width: width * 0.4,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(5.0),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            29, 191, 115, 1),
                                        width: 2,
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(0),
                                    child: Row(children: [
                                      const Text(
                                        "      Lets Start",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      Image.asset(
                                        "assets/Doubleright.png",
                                        width: 50,
                                        height: 20,
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 51.0,
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0.3),
                                      child: Container(
                                        height: 6,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: const Color(0xfff5f5f5),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.07,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0.3),
                                      child: Container(
                                        height: 6,
                                        width: 25,
                                        decoration: BoxDecoration(
                                            color: const Color(0xfff5f5f5),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.07,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(0.3),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: 6,
                                        width: 25,
                                      ),
                                    ),
                                  ],
                                )),
                              )
                            ])),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
