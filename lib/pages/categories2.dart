
import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:diagnose/pages/about.dart';
import 'package:diagnose/pages/full_test_screens/camera_test_ft/camera_test_cmt.dart';
import 'package:diagnose/pages/full_test_screens/connectivity_test_ft/bluetooth.dart';
import 'package:diagnose/pages/full_test_screens/connectivity_test_ft/cellular.dart';
import 'package:diagnose/pages/full_test_screens/connectivity_test_ft/connectivity_test_ct.dart';
import 'package:diagnose/pages/full_test_screens/connectivity_test_ft/gps.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/charging_test_ht.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/face_id_test_ht.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/hardware_test_ht.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/light_sensor_ht.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/originality_test_ht.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/proximity_test_ht.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/side_buttons_ht.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/stress_test_ht.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/vibration_test_ht.dart';
import 'package:diagnose/pages/full_test_screens/motion_testst/just_shake_mt.dart';
import 'package:diagnose/pages/full_test_screens/motion_testst/motion_test_mt.dart';
import 'package:diagnose/pages/full_test_screens/screen_testft/screen_test.dart';
import 'package:diagnose/pages/full_test_screens/sound_testft/sound_test_st.dart';
import 'package:diagnose/pages/quick_test_screens/back_camera.dart';
import 'package:diagnose/pages/quick_test_screens/earpiece.dart';
import 'package:diagnose/pages/quick_test_screens/front_camera.dart';
import 'package:diagnose/pages/quick_test_screens/headphone.dart';
import 'package:diagnose/pages/quick_test_screens/microphone.dart';
import 'package:diagnose/pages/quick_test_screens/mobile.dart';
import 'package:diagnose/pages/quick_test_screens/quick_test.dart';
import 'package:diagnose/pages/quick_test_screens/speaker.dart';
import 'package:diagnose/pages/quick_test_screens/touch_screen.dart';
import 'package:diagnose/pages/quick_test_screens/wifi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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

    Widget testContainers(String image, String name) {
      return Container(
        height: height * 0.06,
        width: width * 0.35,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(0, 172, 238, 10),
            Color.fromRGBO(29, 191, 115, 1),
          ]),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image, semanticsLabel: 'vector'),
            SizedBox(
              width: width * 0.02,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Advent Pro',
                  wordSpacing: 2,
                  fontSize: 16,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700,
                  height: 1),
            ),
          ],
        ),
      );
    }

    Widget gredianticonContainer(String image, String name) {
      return Column(
        children: [
          Stack(
            children: [
              Container(
                height: height * 0.079,
                width: width * 0.155,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xFF1DBF73),
                      Color(0xFF00ACEE),
                    ]),
                    borderRadius: BorderRadius.circular(50)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 1.5,
                  left: 1,
                ),
                child: Container(
                  height: height * 0.074,
                  width: width * 0.15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                      child: Image.asset(
                    image,
                    height: height * 0.05,
                    width: width * 0.08,
                  )),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 3,
              top: 8,
            ),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Advent Pro",
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      drawer: MyDrawer(),
      bottomNavigationBar: NaviBar(),
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/Near_repair_Type_II-removebg-preview.png",
          height: height * 0.1,
          width: width * 0.2,
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.apps,
              color: Colors.black,
            ),
          );
        }),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.help_outline,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
      // bottomNavigationBar: const BottomNavbar(),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          const Text(
            "Categories",
            style: TextStyle(
              fontFamily: "Roboto",
              color: Color(0xFF191D21),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
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
                    child:
                        iconContainer("assets/Screenresolution.png", "Screen")),
                SizedBox(
                  width: width * 0.185,
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
                    child: iconContainer("assets/Sound.png", "Sound")),
                SizedBox(
                  width: width * 0.176,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MotionTestST(),
                        ),
                      );
                    },
                    child: iconContainer("assets/Circuit.png", "Motion")),
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
                    child:
                        iconContainer("assets/Smartphoneram.png", "Hardware")),
                SizedBox(
                  width: width * 0.17,
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
                    child: iconContainer(
                        "assets/Computersconnecting.png", "Connectivity")),
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
                    child: iconContainer("assets/Camera.png", "Camera")),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          // =================
          //     or
          // ================
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Container(
                  color: Colors.grey.withOpacity(0.6),
                  height: height * 0.001,
                  width: width * 0.46,
                ),
              ),
              const Text(
                "or",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Advent Pro",
                    fontWeight: FontWeight.w800),
              ),
              Container(
                color: Colors.grey.withOpacity(0.6),
                height: height * 0.001,
                width: width * 0.46,
              ),
            ],
          ),

          SizedBox(
            height: height * 0.01,
          ),
          // ===========================
          // full test quick test Button
          // ===========================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        reverseDuration: const Duration(seconds: 1),
                        duration: const Duration(seconds: 1),
                        child: const QuickTest(),
                      ),
                    );
                  },
                  child: testContainers('assets/1.svg', "Quick Test")),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        reverseDuration: const Duration(seconds: 1),
                        duration: const Duration(seconds: 1),
                        child: const FullTest(),
                      ),
                    );
                  },
                  child: testContainers('assets/2.svg', "Full Test")),
            ],
          ),

          // =================================
          // main scroller
          // ================================
          SizedBox(
            height: height * 0.01,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 4, bottom: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.6),
                            style: BorderStyle.solid),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Screen"),
                                Stack(
                                  children: [
                                    Container(
                                      height: height * 0.04,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          gradient:
                                              const LinearGradient(colors: [
                                            Color(0xFF1DBF73),
                                            Color(0xFF00ACEE),
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1, left: 1),
                                      child: Container(
                                        height: height * 0.036,
                                        width: width * 0.21,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "Check now",
                                          style: TextStyle(
                                              fontFamily: "Advent Pro",
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14),
                                        )),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.018,
                                ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Screentouch(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Touchpad.png", "Touch Screen"),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Mobilepercent(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Brokenphone.png", "Screen Crack"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.6),
                            style: BorderStyle.solid),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Sound"),
                                Stack(
                                  children: [
                                    Container(
                                      height: height * 0.04,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          gradient:
                                              const LinearGradient(colors: [
                                            Color(0xFF1DBF73),
                                            Color(0xFF00ACEE),
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1, left: 1),
                                      child: Container(
                                        height: height * 0.036,
                                        width: width * 0.21,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "Check now",
                                          style: TextStyle(
                                            fontFamily: "Advent Pro",
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14,
                                          ),
                                        )),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.032,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Speaker(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Speaker.png", "Speaker"),
                                ),
                                SizedBox(
                                  width: width * 0.07,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HEadphone1(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Headphones.png", "Headphone"),
                                ),
                                SizedBox(
                                  width: width * 0.07,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EarPiece(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Earbudheadphones.png", "Earphone"),
                                ),
                                SizedBox(
                                  width: width * 0.07,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Microphone(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Microphone.png", "Microphone"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 8, bottom: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.6),
                            style: BorderStyle.solid),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Motion"),
                                Stack(
                                  children: [
                                    Container(
                                      height: height * 0.04,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          gradient:
                                              const LinearGradient(colors: [
                                            Color(0xFF1DBF73),
                                            Color(0xFF00ACEE),
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1, left: 1),
                                      child: Container(
                                        height: height * 0.036,
                                        width: width * 0.21,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                          child: Text(
                                            "Check now",
                                            style: TextStyle(
                                                fontFamily: "Advent Pro",
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => JustShakeMT(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Speed.png", "Accelerometer"),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => JustShakeMT(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Gyroscope.png", "Gyroscope"),
                                ),
                                SizedBox(
                                  width: width * 0.07,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => JustShakeMT(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Compasssouth.png", "Compass"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 8, bottom: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.6),
                            style: BorderStyle.solid),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Connectivity"),
                                Stack(
                                  children: [
                                    Container(
                                      height: height * 0.04,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          gradient:
                                              const LinearGradient(colors: [
                                            Color(0xFF1DBF73),
                                            Color(0xFF00ACEE),
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(20),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1, left: 1),
                                      child: Container(
                                        height: height * 0.036,
                                        width: width * 0.21,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),),
                                        child: const Center(
                                            child: Text(
                                          "Check now",
                                          style: TextStyle(
                                              fontFamily: "Advent Pro",
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14),
                                        )),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.04,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Bluetooth(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Bluetoothconnected.png",
                                      "Blutooth"),
                                ),
                                SizedBox(
                                  width: width * 0.072,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Wifi(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/images/Wifi.png", "WiFi"),
                                ),
                                SizedBox(
                                  width: width * 0.072,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GpsHT(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Placemarker.png", "GPS"),
                                ),
                                SizedBox(
                                  width: width * 0.072,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CellularHT(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Radiotower.png", "Cellular"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 8, bottom: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.6),
                            style: BorderStyle.solid),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, top: 8, bottom: 8, right: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Hardware"),
                                Stack(
                                  children: [
                                    Container(
                                      height: height * 0.04,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          gradient:
                                              const LinearGradient(colors: [
                                            Color(0xFF1DBF73),
                                            Color(0xFF00ACEE),
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1, left: 1),
                                      child: Container(
                                        height: height * 0.036,
                                        width: width * 0.21,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "Check now",
                                          style: TextStyle(
                                              fontFamily: "Advent Pro",
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14),
                                        )),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.037,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SideButtonsHT(),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: height * 0.079,
                                            width: width * 0.155,
                                            decoration: BoxDecoration(
                                                gradient:
                                                    const LinearGradient(colors: [
                                                  Color(0xFF1DBF73),
                                                  Color(0xFF00ACEE),
                                                ]),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 1.5,
                                              left: 1,
                                            ),
                                            child: Container(
                                              height: height * 0.074,
                                              width: width * 0.15,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(50)),
                                              child: Center(
                                                  child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  Image.asset(
                                                    "assets/Minus.png",
                                                    height: height * 0.028,
                                                    width: width * 0.06,
                                                  ),
                                                  Image.asset(
                                                    "assets/Plus.png",
                                                    height: height * 0.028,
                                                    width: width * 0.06,
                                                  ),
                                                ],
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          left: 3,
                                          top: 8,
                                        ),
                                        child: Text(
                                          "Buttons",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: "Advent Pro",
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.077,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProximityTestHT(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Proximitysensor.png", "Proximity"),
                                ),
                                SizedBox(
                                  width: width * 0.07,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChargingTestHT(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Electrical.png", "Charger"),
                                ),
                                SizedBox(
                                  width: width * 0.07,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VibrationTestHT(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/images/viberate.png", "Viberation"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LightSensorTestHT(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Infraredsensor.png",
                                      "Light Sensor"),
                                ),
                                SizedBox(
                                  width: width * 0.06,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FaceIdTestHT(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Faceid.png", "Face ID"),
                                ),
                                SizedBox(
                                  width: width * 0.07,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StressTestHT(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Lowbattery.png", "Stress Test"),
                                ),
                                SizedBox(
                                  width: width * 0.066,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChargingTestHT(),
                                      ),
                                    );
                                  },
                                    child: gredianticonContainer(
                                        "assets/Chargingstation.png",
                                        "Wireless\nCharging"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.045,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OriginalityTestHT(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Microchip.png", "Originality"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 8, bottom: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.6),
                            style: BorderStyle.solid),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Camera"),
                                Stack(
                                  children: [
                                    Container(
                                      height: height * 0.04,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          gradient:
                                              const LinearGradient(colors: [
                                            Color(0xFF1DBF73),
                                            Color(0xFF00ACEE),
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 1, left: 1),
                                      child: Container(
                                        height: height * 0.036,
                                        width: width * 0.21,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                            child: Text(
                                          "Check now",
                                          style: TextStyle(
                                              fontFamily: "Advent Pro",
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14),
                                        )),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.04,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FrontCamera(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Camera.png", "Front Camera"),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BackCamera(),
                                      ),
                                    );
                                  },
                                  child: gredianticonContainer(
                                      "assets/Switchcamera.png", "Back Camera"),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                GestureDetector(
                               onTap: (){},
                                  child: gredianticonContainer(
                                      "assets/Flashoff.png", "LED Flash"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
