import 'dart:async';

import 'package:diagnose/pages/quick_test_screens/success_screen_touch.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Boxes extends StatefulWidget {
  @override
  _BoxesState createState() => _BoxesState();
}

class _BoxesState extends State<Boxes> {
  @override
  void initState() {
    super.initState();
    print("ok");
  }

  void chckcondition() {
    if (click1 == true &&
        click2 == true &&
        click3 == true &&
        click4 == true &&
        click5 == true &&
        click6 == true &&
        click7 == true &&
        click8 == true &&
        click9 == true &&
        click10 == true &&
        click11 == true &&
        click12 == true &&
        click13 == true &&
        click14 == true &&
        click15 == true &&
        click16 == true &&
        click17 == true &&
        click18 == true &&
        click19 == true &&
        click21 == true &&
        click22 == true &&
        click23 == true &&
        click24 == true &&
        click25 == true &&
        click26 == true &&
        click27 == true &&
        click28 == true &&
        click29 == true &&
        click30 == true &&
        click31 == true &&
        click32 == true) {
      print("All click");
      Timer((Duration(seconds: 1)), ()=>{
         Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    reverseDuration: Duration(seconds: 1),
                                    duration: Duration(seconds: 1),
                                    child: Successfull2(),),)
      });
        
    }
    else{
      print("Plz Click All White Box");
    }
  }
  // bool click = true;

  bool click1 = false;
  bool click2 = false;
  bool click3 = false;
  bool click4 = false;
  bool click5 = false;
  bool click6 = false;
  bool click7 = false;
  bool click8 = false;
  bool click9 = false;
  bool click10 = false;
  bool click11 = false;
  bool click12 = false;
  bool click13 = false;
  bool click14 = false;
  bool click15 = false;
  bool click16 = false;
  bool click17 = false;
  bool click18 = false;
  bool click19 = false;
  bool click20 = false;
  bool click21 = false;
  bool click22 = false;
  bool click23 = false;
  bool click24 = false;
  bool click25 = false;
  bool click26 = false;
  bool click27 = false;
  bool click28 = false;
  bool click29 = false;
  bool click30 = false;
  bool click31 = false;
  bool click32 = false;
  bool click33 = false;
  // bool click34 = false;
// bool click1=false;
// bool click1=false;
// bool click1=false;
// bool click1=false;
// bool click1=false;
// bool click1=false;
// bool click1=false;
// bool click1=false;
// bool click1=false;

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Diagose1Widget - FRAME
    Size size = MediaQuery.of(context).size;
    Color _colorContainer = Colors.blue;
    return GestureDetector(
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>TouchSuccess()));
      // },
      child: Container(
        width: size.width * 0.4,
        height: size.height * 0.8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(29, 191, 115, 1),
                Color.fromRGBO(0, 172, 238, 1)
              ]),
        ),
        child: Stack(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5.0, left: 5, top: 30.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click1 = !click1;
                              chckcondition();
                            });
                            // Navigator.push(
                            //     context,
                            //     PageTransition(
                            //         type: PageTransitionType.rightToLeft,
                            //         reverseDuration: Duration(seconds: 1),
                            //         duration: Duration(seconds: 1),
                            //         child: Successfull2(),),);
                          },
                          child: Container(
                            height: 50,
                            width: 58,
                            color: (click1 == false)
                                ? Colors.white
                                : Colors.transparent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                click2 = !click2;
                              chckcondition();

                              });
                            },
                            child: Container(
                                height: 50,
                                width: 58,
                                color: (click2 == false)
                                    ? Colors.white
                                    : Colors.transparent)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                click3 = !click3;
                              chckcondition();

                              });
                            },
                            child: Container(
                                height: 50,
                                width: 58,
                                color: (click3 == false)
                                    ? Colors.white
                                    : Colors.transparent)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                click4 = !click4;
                              chckcondition();

                              });
                            },
                            child: Container(
                                height: 50,
                                width: 58,
                                color: (click4 == false)
                                    ? Colors.white
                                    : Colors.transparent)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                click5 = !click5;
                              chckcondition();

                              });
                            },
                            child: Container(
                                height: 50,
                                width: 58,
                                color: (click5 == false)
                                    ? Colors.white
                                    : Colors.transparent)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                click6 = !click6;
                              chckcondition();

                              });
                            },
                            child: Container(
                                height: 50,
                                width: 58,
                                color: (click6 == false)
                                    ? Colors.white
                                    : Colors.transparent)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                click7 = !click7;
                              chckcondition();

                              });
                            },
                            child: Container(
                                height: 50,
                                width: 58,
                                color: (click7 == false)
                                    ? Colors.white
                                    : Colors.transparent)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                click8 = !click8;
                              chckcondition();

                              });
                            },
                            child: Container(
                                height: 50,
                                width: 58,
                                color: (click8 == false)
                                    ? Colors.white
                                    : Colors.transparent)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                click9 = !click9;
                              chckcondition();

                              });
                            },
                            child: Container(
                                height: 50,
                                width: 58,
                                color: (click9 == false)
                                    ? Colors.white
                                    : Colors.transparent)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 58, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                click10 = !click10;
                              chckcondition();

                              });
                            },
                            child: Container(
                                height: 50,
                                width: 58,
                                color: (click10 == false)
                                    ? Colors.white
                                    : Colors.transparent)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click11 = !click11;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 58,
                              color: (click11 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click12 = !click12;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 58,
                              color: (click12 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click13 = !click13;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 58,
                              color: (click13 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click14 = !click14;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 48,
                              color: (click14 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 58, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click15 = !click15;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 58,
                              color: (click15 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click16 = !click16;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 58,
                              color: (click16 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click17 = !click17;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 58,
                              color: (click17 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click18 = !click18;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 58,
                              color: (click18 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click19 = !click19;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 48,
                              color: (click19 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 58, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 48, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click20 = !click20;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 48,
                              color: (click20 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click21 = !click21;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 58,
                              color: (click21 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click22 = !click22;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 40,
                              color: (click22 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click23 = !click23;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 40,
                              color: (click23 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click24 = !click24;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 40,
                              color: (click24 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 65, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 65, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click25 = !click25;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 58,
                              color: (click25 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click26 = !click26;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 58,
                              color: (click26 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click27 = !click27;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              color: (click27 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click28 = !click28;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 40,
                              color: (click28 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 65, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 65, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 58, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click29 = !click29;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 58,
                              color: (click29 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click30 = !click30;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              color: (click30 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 40, color: Colors.transparent),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 65, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 65, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 58, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 58, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click31 = !click31;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              color: (click31 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 40, color: Colors.transparent),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 65, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 65, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 58, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 58, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Container(
                            height: 50, width: 50, color: Colors.transparent),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              click32 = !click32;
                              chckcondition();

                            });
                          },
                          child: Container(
                              height: 50,
                              width: 40,
                              color: (click32 == false)
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
