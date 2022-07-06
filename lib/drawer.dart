import 'package:diagnose/appointments_screens/appoinment_items.dart';
import 'package:diagnose/navbar/navb.dart';
import 'package:diagnose/pages/about.dart';
import 'package:diagnose/pages/account2.dart';
import 'package:diagnose/pages/setting2.dart';
import 'package:diagnose/pages/wish_llist2.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  // get user => _auth.currentUser;
  // // String name;
  // Future signOut() async {
  //   await _googleSignIn.signOut();
  //   await _auth.signOut();

  //   print('signout');
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 150,
            color: Colors.white,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/HD-wallpaper-settings-clock-gear-mechanic.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8),
                    BlendMode.hardLight,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0, left: 20.0),
                    child: Container(
                        width: 69,
                        height: 69,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.20000000298023224),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ],
                          image: DecorationImage(
                              image: AssetImage('assets/Ellipse2.png'),
                              fit: BoxFit.fitWidth),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(69, 69)),
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 110.0, left: 10.0),
                      child: Text(
                        "Jennifer Winget",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      )),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavbar(),),);
                                },
                            child: SizedBox(
                                width: 79,
                                height: 25,
                                child: Stack(children: <Widget>[
                                  Positioned(
                                      top: 10,
                                      left: 40,
                                      child: Text(
                                        'Home',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(34, 34, 34, 1),
                                            fontFamily: 'Avenir',
                                            fontSize: 14,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      )),
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(255, 255, 255, 1),
                                          ),
                                          child: Stack(children: <Widget>[
                                            Positioned(
                                              top: 1.2094953060150146,
                                              left: 1.5625,
                                              child: Icon(Icons.home),
                                            ),
                                          ]))),
                                ])),
                          ),
                        ],
                      ),
                    ), // Figma Flutter Generator Group3Widget - GROUP
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Account2(),),);
                                },
                            child: SizedBox(
                                width: 79,
                                height: 25,
                                child: Stack(children: <Widget>[
                                  Positioned(
                                      top: 10,
                                      left: 40,
                                      child: Text(
                                        'Profile',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(34, 34, 34, 1),
                                            fontFamily: 'Avenir',
                                            fontSize: 14,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      )),
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                          ),
                                          child: Stack(children: <Widget>[
                                            Positioned(
                                              top: 1.2094953060150146,
                                              left: 1.5625,
                                              child: Icon(
                                                  Icons.account_circle_rounded),
                                            ),
                                          ]))),
                                ])),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 100,
                              height: 25,
                              child: Stack(children: <Widget>[
                                Positioned(
                                    top: 10,
                                    left: 40,
                                    child: GestureDetector(
                                      onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => About(),),);
                                },
                                      child: Text(
                                        'About us',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(34, 34, 34, 1),
                                            fontFamily: 'Avenir',
                                            fontSize: 14,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    )),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                            top: 1.2094953060150146,
                                            left: 1.5625,
                                            child: Icon(Icons.info_outlined),
                                          ),
                                        ]))),
                              ])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppointmentsItem(),),);
                                },
                            child: SizedBox(
                                width: 150,
                                height: 25,
                                child: Stack(children: <Widget>[
                                  Positioned(
                                      top: 10,
                                      left: 40,
                                      child: Text(
                                        'Appointment',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(34, 34, 34, 1),
                                            fontFamily: 'Avenir',
                                            fontSize: 14,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      )),
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(255, 255, 255, 1),
                                          ),
                                          child: Stack(children: <Widget>[
                                            Positioned(
                                              top: 1.2094953060150146,
                                              left: 1.5625,
                                              child: Icon(Icons.event_note),
                                            ),
                                          ]))),
                                ])),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 150,
                              height: 25,
                              child: Stack(children: <Widget>[
                                Positioned(
                                    top: 10,
                                    left: 40,
                                    child: Text(
                                      'Message',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(34, 34, 34, 1),
                                          fontFamily: 'Avenir',
                                          fontSize: 14,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    )),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                            top: 1.2094953060150146,
                                            left: 1.5625,
                                            child: Icon(Icons.message),
                                          ),
                                        ]))),
                              ])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 150,
                              height: 25,
                              child: Stack(children: <Widget>[
                                Positioned(
                                    top: 10,
                                    left: 40,
                                    child: Text(
                                      'Purchase',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(34, 34, 34, 1),
                                          fontFamily: 'Avenir',
                                          fontSize: 14,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    )),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                            top: 1.2094953060150146,
                                            left: 1.5625,
                                            child: Icon(
                                                Icons.account_balance_wallet),
                                          ),
                                        ]))),
                              ])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 150,
                              height: 25,
                              child: Stack(children: <Widget>[
                                Positioned(
                                    top: 10,
                                    left: 40,
                                    child: Text(
                                      'Schedule',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(34, 34, 34, 1),
                                          fontFamily: 'Avenir',
                                          fontSize: 14,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    )),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                            top: 1.2094953060150146,
                                            left: 1.5625,
                                            child: Icon(Icons.schedule),
                                          ),
                                        ]))),
                              ])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => WishList2(),),);
                                },
                            child: SizedBox(
                                width: 150,
                                height: 25,
                                child: Stack(children: <Widget>[
                                  Positioned(
                                      top: 10,
                                      left: 40,
                                      child: Text(
                                        'My Cart',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(34, 34, 34, 1),
                                            fontFamily: 'Avenir',
                                            fontSize: 14,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      )),
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(255, 255, 255, 1),
                                          ),
                                          child: Stack(children: <Widget>[
                                            Positioned(
                                              top: 1.2094953060150146,
                                              left: 1.5625,
                                              child: Icon(Icons.shopping_cart),
                                            ),
                                          ]))),
                                ])),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 150,
                              height: 25,
                              child: Stack(children: <Widget>[
                                Positioned(
                                    top: 10,
                                    left: 40,
                                    child: Text(
                                      'Promotion',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(34, 34, 34, 1),
                                          fontFamily: 'Avenir',
                                          fontSize: 14,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    )),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                            top: 1.2094953060150146,
                                            left: 1.5625,
                                            child: Icon(Icons.sell),
                                          ),
                                        ]))),
                              ])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 150,
                              height: 25,
                              child: Stack(children: <Widget>[
                                Positioned(
                                    top: 10,
                                    left: 40,
                                    child: Text(
                                      'Support',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(34, 34, 34, 1),
                                          fontFamily: 'Avenir',
                                          fontSize: 14,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    )),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                            top: 1.2094953060150146,
                                            left: 1.5625,
                                            child: Icon(Icons.headset_mic),
                                          ),
                                        ]))),
                              ])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Setting2(),),);
                                },
                            child: SizedBox(
                                width: 150,
                                height: 25,
                                child: Stack(children: <Widget>[
                                  Positioned(
                                      top: 10,
                                      left: 40,
                                      child: Text(
                                        'Settings',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(34, 34, 34, 1),
                                            fontFamily: 'Avenir',
                                            fontSize: 14,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      )),
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(255, 255, 255, 1),
                                          ),
                                          child: Stack(children: <Widget>[
                                            Positioned(
                                              top: 1.2094953060150146,
                                              left: 1.5625,
                                              child: Icon(Icons.settings),
                                            ),
                                          ]))),
                                ])),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 340.0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: 90,
                              height: 25,
                              child: Stack(children: <Widget>[
                                Positioned(
                                    top: 10,
                                    left: 40,
                                    child: Text(
                                      'Logout',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(34, 34, 34, 1),
                                          fontFamily: 'Adevent Pro',
                                          fontSize: 10,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    )),
                                Positioned(
                                    top: 0,
                                    left: 10,
                                    child: Container(
                                        width: 120,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                        ),
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                              top: 1.2094953060150146,
                                              left: 1.5625,
                                              child: Text(
                                                'App Version-V2.00',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        34, 34, 34, 1),
                                                    fontFamily: 'Adevent Pro',
                                                    fontSize: 10,
                                                    letterSpacing:
                                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1),
                                              )),
                                        ]))),
                              ])),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Category
        ],
      ),
    );
  }
}
