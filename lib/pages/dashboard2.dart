import 'package:diagnose/auth/SignUp.dart';
import 'package:diagnose/auth/login.dart';
import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:diagnose/pages/about.dart';
import 'package:diagnose/pages/backup_restor/connecting.dart';
import 'package:diagnose/pages/categories2.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class DashBoard2 extends StatefulWidget {
  const DashBoard2({Key? key}) : super(key: key);

  @override
  State<DashBoard2> createState() => _DashBoard2State();
}

class _DashBoard2State extends State<DashBoard2> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget makDiv(String image, String title, String description) {
      return Container(
        height: height * 0.19,
        width: width * 0.38,
        decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(
              blurRadius: 10,
              color: Colors.grey,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              height: height * 0.1,
              width: width * 0.21,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                  fontSize: 12),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w300,
                  fontSize: 9,
                  color: Color(0xFF626262)),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      drawer: MyDrawer(),
      bottomNavigationBar: const NaviBar(),
      appBar: AppBar(
        title: Image.asset(
          "assets/Near_repair_Type_II-removebg-preview.png",
          height: height * 0.1,
          width: width * 0.2,
        ),
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
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.notifications,
              color: Colors.black,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      reverseDuration: Duration(seconds: 1),
                      duration: Duration(seconds: 1),
                      child: About(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.help_outline,
                  color: Colors.black,
                  size: 30,
                )),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xffD6D7D7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.11,
              width: width * 0.85,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey,
                    )
                  ],
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(0, 172, 238, 10),
                    Color.fromRGBO(29, 191, 115, 1),
                  ]),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/apbarr.png",
                      height: height * 0.13,
                      width: width * 0.13,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Book your appointment",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFFF)),
                      ),
                      Text(
                        "Find nearest repair store with free quotation",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 9,
                            fontWeight: FontWeight.w300,
                            color: Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                makDiv(
                    "assets/Icons/carbon_wifi-not-secure.png",
                    "Network Unlock",
                    "After unlock you can use your\nPhone any country and any sim"),
                SizedBox(
                  width: width * 0.082,
                ),
                makDiv("assets/Icons/icon-png (1).png", "Buy/Sale Devices",
                    "Now phone buy and sale is easier\nthen before you can see all prices\nand sell your phone just in minutes"),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                makDiv("assets/Icons/icon-ss.png", "TopUp You Phone",
                    "You can load your talk time\nBalance over counteries just by\nnumber"),
                SizedBox(
                  width: width * 0.082,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home2(),
                      ),
                    );
                  },
                  child: makDiv(
                      "assets/Icons/Diagnostic-icon.png",
                      "Diagnostics",
                      "You can diagnos the all issue in\nyour phone in one clicke"),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConnectiongBK(),
                      ),
                    );
                  },
                  child: makDiv("assets/Icons/icon2.png", "Back Up & Restore",
                      "You can transfer your data faster\nand sequre to PC or Phone"),
                ),
                SizedBox(
                  width: width * 0.082,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: makDiv("assets/Icons/Grocery Store.png", "Store",
                      "All quantity products cheaper price,Then everywhere buy conline or walk in your nearest store."),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
