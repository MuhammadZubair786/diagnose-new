import 'package:diagnose/pages/slide1_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SelectWidget extends StatefulWidget {
  const SelectWidget({Key? key}) : super(key: key);

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,alignment: Alignment.center,
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
          ),
          Column(
              
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Image.asset(
                  'assets/Near_repair_Type_II-removebg-preview.png',
                  height: height * 0.16,
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              const Text(
                'Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Roboto',
                    fontSize: 46,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
              SizedBox(
                height: height * 0.005,
              ),
              const Text(
                'Please enter Phone Number and password',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Advent Pro',
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
              SizedBox(
                height: height * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Column(
                  
         
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.topToBottom,
                            reverseDuration: const Duration(seconds: 1),
                            duration: const Duration(seconds: 1),
                            child: Slide1Widget(),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                              width: width * 0.6,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0XFF1DBF73),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Go with client',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Advent Pro',
                                      fontSize: 25,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                                SizedBox(
                                  width: width * 0.08,
                                ),
                                Container(
                                  width: width * 0.06,
                                  height: height * 0.04,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/Doubleright.png'),
                                        fit: BoxFit.fitWidth),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.topToBottom,
                            reverseDuration: const Duration(seconds: 1),
                            duration: const Duration(seconds: 1),
                            child: Slide1Widget(),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                              width: width * 0.6,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0XFF1DBF73),
                                  width: 2,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Go with shop',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Advent Pro',
                                      fontSize: 25,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                                SizedBox(
                                  width: width * 0.08,
                                ),
                                Container(
                                  width: width * 0.06,
                                  height: height * 0.04,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/Doubleright.png'),
                                        fit: BoxFit.fitWidth),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
