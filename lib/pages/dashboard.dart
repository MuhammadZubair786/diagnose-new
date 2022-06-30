import 'package:diagnose/auth/SignUp.dart';
import 'package:diagnose/auth/login.dart';
import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/navb.dart';
import 'package:diagnose/pages/about.dart';
import 'package:diagnose/pages/backup_restor/connecting.dart';
import 'package:diagnose/pages/categories.dart';
import 'package:diagnose/pages/categories2.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget makDiv(
        String image, String title, String description, double size1) {
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
          mainAxisSize: MainAxisSize.max,
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
              height: height * 0.014,
            ),
            Flexible(
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                    fontSize: size1,
                    color: Color(0xFF626262)),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      drawer: MyDrawer(),
      // bottomNavigationBar: const BottomNavbar(),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Image.asset(
            "assets/Near_repair_Type_II-removebg-preview.png",
            height: height * 0.1,
            width: width * 0.2,
          ),
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
                    "After unlock you can use your\nPhone any country and any\nsim",
                    9),
                SizedBox(
                  width: width * 0.082,
                ),
                makDiv("assets/Icons/icon-png (1).png", "Buy/Sale Devices",
                    "Now phone buy and sale is easier\nthen before you can see all prices\nand sell your phone just in minutes",8),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                makDiv("assets/Icons/icon-ss.png", "TopUp You Phone",
                    "You can load your talk time\nBalance over counteries just\nby number",9),
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
                      "You can diagnos the\nallissue in your phone in\none clicke",10),
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
                      "You can transfer your data\nfaster and sequre to PC\nor Phone",10),
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
                      "All quantity products cheaper price,Then everywhere buy conline or walk in your nearest store.",9),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
