import 'dart:async';

import 'package:flutter/material.dart';

import 'intro.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Intro()
              // TabsPage()
              ));
      //  Navigator.push(
      //                   context,
      //                   PageTransition(
      //                       type: PageTransitionType.rotate,
      //                       child: LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                    'assets/HD-wallpaper-settings-clock-gear-mechanic.jpg'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8),
                  BlendMode.hardLight,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/apbar.png",
                  height: height * 0.17,
                  width: width * 0.5,
                ),
                const Text(
                  "Now mobile in save hand like yours",
                  style: TextStyle(
                    fontFamily: "Advent Pro",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Loading",
                      style: TextStyle(
                        fontFamily: "Advent Pro",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    Image.asset(
                      "assets/loading.gif",
                      height: height * 0.1,
                      width: width * 0.2,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
