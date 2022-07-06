// ignore_for_file: unnecessary_const


import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:diagnose/navbar/navb.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: const NaviBar(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(builder: (context) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      reverseDuration: const Duration(seconds: 1),
                      duration: const Duration(seconds: 1),
                      child: const BottomNavbar(),
                    ),
                  );
                },
                child:Icon(Icons.reply,color: Colors.black,size: 40,),);
          }),
        ),
        body: Container(
            decoration: const BoxDecoration(
              color: const Color(0xffF7F9FA),
            ),
            width: width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Text(
                      "About ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: height * 0.22,
                      width: width * 0.85,
                      child: Card(
                        elevation: 20,
                        shadowColor: Colors.grey[300],
                        color: Colors.white70,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60.0),
                              child: Image.asset(
                            "assets/apbar.png",
                            height: 80,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.13,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 45.0, right: 10),
                    child: const Text(
                      "   All Over details\n about application",
                      style:
                          const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],),),);
  }
}






// Image.asset(
//                   "assets/icon.png",
//                   height: height * 0.0002,
//                   width: width * 0.01,
//                 )