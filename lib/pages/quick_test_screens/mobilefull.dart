
import 'package:diagnose/pages/full_test_screens/screen_testft/mobileft.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MobileFullScreenQT extends StatefulWidget {
  const MobileFullScreenQT({Key? key}) : super(key: key);

  @override
  State<MobileFullScreenQT> createState() => _MobileFullScreenQTState();
}

class _MobileFullScreenQTState extends State<MobileFullScreenQT> {
  var Box1 = false;
  var Box2 = false;
  var Box3 = false;
  var Box4 = false;

  void check() {
    if (Box1 == true && Box2 == true && Box3 == true && Box4 == true) {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          reverseDuration: const Duration(seconds: 1),
          duration: const Duration(seconds: 1),
          child: const MobilepercentFT(),
        ),
      );
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(top:1),
        width: width,
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/screen.png',
            ),
            fit: BoxFit.cover,
          ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    print("ok");

                    setState(() {
                      Box1 = true;
                      check();
                    });
                  },
                  child: Box1 == true
                      ? Container(
                          height: height * 0.5,
                          width: width * 0.50,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          //  margin: EdgeInsets.all(40),
                          child: const Center(child: Text("check")))
                      : Container(
                          height: height * 0.5,
                          width: width * 0.50,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          //  margin: EdgeInsets.all(40),
                          child: const Center(child: Text("Side 1"))),
                ),
                GestureDetector(
                  onTap: () {
                    print("ok");

                    setState(() {
                      Box2 = true;
                      check();
                    });
                  },
                  child: Box2 == true
                      ? Container(
                          height: height * 0.5,
                          width: width * 0.50,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          //  margin: EdgeInsets.all(40),
                          child: const Center(child: Text("check")))
                      : Container(
                          height: height * 0.5,
                          width: width * 0.5,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          //  margin: EdgeInsets.all(40),
                          child: const Center(child: Text("Side 2"))),
                ),
              ],
            ),

            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    print("ok");
                    setState(() {
                      Box3 = true;
                      check();
                    });
                  },
                  child: Box3 == true
                      ? Container(
                          height: height * 0.5,
                          width: width * 0.50,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          //  margin: EdgeInsets.all(40),
                          child: const Center(child: Text("check")))
                      : Container(
                          height: height * 0.5,
                          width: width * 0.5,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          //  margin: EdgeInsets.all(40),
                          child: const Center(child: Text("Side 3"))),
                ),
                GestureDetector(
                  onTap: () {
                    print("ok");

                    setState(() {
                      Box4 = true;
                      check();
                    });
                  },
                  child: Box4 == true
                      ? Container(
                          height: height * 0.5,
                          width: width * 0.50,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          //  margin: EdgeInsets.all(40),
                          child: const Center(child: Text("check")))
                      : Container(
                          height: height * 0.5,
                          width: width * 0.5,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          //  margin: EdgeInsets.all(40),
                          child: const Center(child: Text("Side 4"))),
                ),
              ],
            ),
            //   GestureDetector(
            //   onTap: (){
            //     setState(() {
            //       Box4=true;
            //     });
            //   },
            //   child: Container(
            //       height: height * 0.25,
            //       width: width * 0.25,
            //       padding: const EdgeInsets.only(top: 10, left: 10),
            //       //  margin: EdgeInsets.all(40),
            //       child: const Center(child: Text("Side 4"))),
            // )
          ],
        ),
      ),
    );
  }
}

