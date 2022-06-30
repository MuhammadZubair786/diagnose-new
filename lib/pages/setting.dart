// ignore_for_file: prefer_const_constructors

import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:diagnose/navbar/navb.dart';
import 'package:diagnose/pages/about.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:page_transition/page_transition.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
    
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      reverseDuration: Duration(seconds: 1),
                      duration: Duration(seconds: 1),
                      child: About(),
                    ),
                  );
                },
                child: Icon(
                  Icons.help_outline,
                  color: Colors.black,
                ),
              )),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 200),
            child: Text(
              "Settings",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 5),
            child: Container(
              width: width * 0.9,
              height: height * 0.25,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Card(
                elevation: 20,
                shadowColor: Colors.grey[300],
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Image.asset(
                        "assets/slode2.png",
                        height: 130,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        "System will\nbe in your\nhand just\n allow us !",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Send diagnostic information on server"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: GFToggle(
                    enabledTrackColor: Color(0xff01a5ae),
                    onChanged: (val) {},
                    value: true,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Access your mobile system"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 88.0),
                  child: GFToggle(
                    enabledTrackColor: Color(0xff01a5ae),
                    onChanged: (val) {},
                    value: true,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "We Will decide in development phase\n                       App Setting",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Roboto',
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ),
        ],
      ),
    );
  }
}
