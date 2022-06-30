import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:flutter/material.dart';



class AppDataRestore extends StatefulWidget {
  const AppDataRestore({Key? key}) : super(key: key);

  @override
  State<AppDataRestore> createState() => _AppDataRestoreState();
}

class _AppDataRestoreState extends State<AppDataRestore> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: MyDrawer(),
      bottomNavigationBar: NaviBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Positioned(
              top: 20,
              child: Icon(
                Icons.apps,
                color: Colors.black,
              ),
            ),
          );
        }),
      ),
      body: Container(
          child: Column(children: [
        Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                child: Image.asset(
                              "assets/icon.png",
                              height: 30,
                              width: 30,
                            ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Container(
                            child: Text(
                          "App Data",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Container(),
                      ),
                    ],),),),
        SizedBox(
          height: height * 0.20,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "In which format will\n be decide in \ndevelopment phase",
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Advenet Pro',
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
      ])),
    );
  }
}
