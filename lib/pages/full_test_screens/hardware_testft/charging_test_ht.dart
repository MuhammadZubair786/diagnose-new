// import 'dart:async';

// import 'package:diagnose/pages/full_test_screens/hardware_testft/vibration_test_ht.dart';
// import 'package:diagnose/pages/full_test_screens/screen_testft/BoxesFt.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:battery_plus/battery_plus.dart';

// class ChargingTestHT extends StatefulWidget {
//   const ChargingTestHT({Key? key}) : super(key: key);

//   @override
//   State<ChargingTestHT> createState() => _ChargingTestHTState();
// }

// class _ChargingTestHTState extends State<ChargingTestHT> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//      var battery = Battery();
//   int level = 100;

//    BatteryState batteryState = BatteryState.full;
//   late Timer timer;
//   late StreamSubscription streamSubscription;
//     // Figma Flutter Generator Diagose1Widget - FRAME


//    @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getBatteryPercentage();
//     getBatteryState();
//     timer = Timer.periodic(Duration(seconds: 5), (timer) {
//       getBatteryPercentage();
//     });
//   }

//   void getBatteryPercentage() async {
//     final batteryLevel = await battery.batteryLevel;

//     this.level = batteryLevel;

//     setState(() {});
//   }

//   void getBatteryState() {
//     streamSubscription = battery.onBatteryStateChanged.listen((state) {
//       setState(() {
//         this.batteryState = state;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     streamSubscription.cancel();
//     timer.cancel();
//   }

//     return Scaffold(
//       body: Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color.fromRGBO(29, 191, 115, 1),
//                 Color.fromRGBO(0, 172, 238, 1)
//               ]),
//         ),
//         child: Column(
//           children: [
//             SizedBox(
//               height: height * 0.08,
//             ),
//             Text(
//               '4/8',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Color.fromRGBO(255, 255, 255, 1),
//                 fontFamily: 'Roboto',
//                 fontSize: 12,
//                 decoration: TextDecoration.none,
//                 letterSpacing: -0.3333333432674408,
//                 fontWeight: FontWeight.normal,
//                 height: 1,
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SvgPicture.asset('assets/vector.svg', semanticsLabel: 'vector'),
//                 SizedBox(
//                   width: width * 0.04,
//                 ),
//                 Container(
//                   width: width * 0.7,
//                   child: LinearProgressIndicator(
//                     value: 0.5,
//                     backgroundColor: Colors.white.withOpacity(0.5),
//                     valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: height * 0.05,
//             ),
//             // Container(
//             //   width: width * 0.3,
//             //   height: height * 0.3,
//             //   decoration: BoxDecoration(
//             //     image: DecorationImage(
//             //         image: AssetImage(
//             //           'assets/Gif/charging.gif',
//             //         ),
//             //         fit: BoxFit.fill),
//             //   ),
//             // ),
//             // SizedBox(
//             //   height: height * 0.05,
//             // ),
//             // Text(
//             //   'Charging',
//             //   textAlign: TextAlign.center,
//             //   style: TextStyle(
//             //       color: Color.fromRGBO(255, 255, 255, 1),
//             //       fontFamily: 'Roboto',
//             //       fontSize: 33,
//             //       decoration: TextDecoration.none,
//             //       letterSpacing:
//             //           0 /*percentages not used in flutter. defaulting to zero*/,
//             //       fontWeight: FontWeight.normal,
//             //       height: 1),
//             // ),
//             // SizedBox(
//             //   height: height * 0.01,
//             // ),
//             Text(
//               'Use cable or wireless charger',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: Color.fromRGBO(255, 255, 255, 1),
//                   fontFamily: 'Advent Pro',
//                   fontSize: 16,
//                   decoration: TextDecoration.none,
//                   letterSpacing:
//                       0 /*percentages not used in flutter. defaulting to zero*/,
//                   fontWeight: FontWeight.normal,
//                   height: 1),
//             ),
//             SizedBox(
//               height: height * 0.16,
//             ),
//             Padding(
//               padding:
//                   const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 0),
//               child: SizedBox(
//                 width: width * 0.6,
//                 height: height * 0.07,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     primary: Colors.white,
//                     elevation: 6,
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       PageTransition(
//                           type: PageTransitionType.rightToLeft,
//                           reverseDuration: const Duration(seconds: 1),
//                           duration: const Duration(seconds: 1),
//                           child: VibrationTestHT()),
//                     );
//                   },
//                   child: const Text(
//                     "Ok",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       letterSpacing: 2,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 25,
//                       color: Colors.black,
//                       fontFamily: 'Advent Pro',
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

    
//   }
//    Widget BuildBattery(BatteryState state) {
//     switch (state) {
//       case BatteryState.full:
//         return Container(
//           child: Icon(
//             Icons.battery_full,
//             size: 200,
//             color: Colors.green,
//           ),
//           width: 200,
//           height: 200,
//         );
//       case BatteryState.charging:
//         return Container(
//           child:
//               Icon(Icons.battery_charging_full, size: 200, color: Colors.green),
//           width: 200,
//           height: 200,
//         );
//       case BatteryState.discharging:

//       default:
//         return Container(
//           child: Icon(Icons.battery_alert, size: 200, color: Colors.grey),
//           width: 200,
//           height: 200,
//         );
//     }
//   }
// }

import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:diagnose/pages/full_test_screens/hardware_testft/vibration_test_ht.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class ChargingTestHT extends StatefulWidget {
  const ChargingTestHT({Key? key}) : super(key: key);

  @override
  _ChargingTestHTState createState() => _ChargingTestHTState();
}

class _ChargingTestHTState extends State<ChargingTestHT> {
    
  var battery = Battery();
  int level = 100;
  BatteryState batteryState = BatteryState.full;
  late Timer timer;
  late StreamSubscription streamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBatteryPercentage();
    getBatteryState();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      getBatteryPercentage();
    });
  }

  void getBatteryPercentage() async {
    final batteryLevel = await battery.batteryLevel;

    this.level = batteryLevel;

    setState(() {});
  }

  void getBatteryState() {
    streamSubscription = battery.onBatteryStateChanged.listen((state) {
      setState(() {
        this.batteryState = state;
      });
    });
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    timer.cancel();
  }

  Widget BuildBattery(BuildContext context, BatteryState state) {
       double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    switch (state) {
      case BatteryState.full:
        return Container(
          child: Icon(
            Icons.battery_full,
            size: 200,
            color: Colors.green,
          ),
          width: 200,
          height: 200,
        );
      case BatteryState.charging:
      return  
      Container(
              width: width * 0.3,
              height: height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/Gif/charging.gif',
                    ),
                    fit: BoxFit.fill),
              ),
      );
        // return Container(
        //   child:
        //       Icon(Icons.battery_charging_full, size: 200, color: Colors.green),
        //   width: 200,
        //   height: 200,
        // );
      case BatteryState.discharging:

      default:
        return  Container(
              width: width * 0.3,
              height: height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/Gif/charging.gif',
                    ),
                    fit: BoxFit.fill),
              ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           SizedBox(
             height: height*0.06,
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
            height: height * 0.2,
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildBattery(context,batteryState),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
              '${level} % \nBattery Health ',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
                ),
              ],
            ),
              SizedBox(
            height: height * 0.2,
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
                          child: VibrationTestHT()),
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
            
            // ElevatedButton(onPressed: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
            // },
            //  child: Text("Sensor"))
          ],
        ),
      ),
    );
  }
}
