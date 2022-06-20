import 'dart:async';
import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:diagnose/pages/backup_restor/restore/data_backup_restore.dart';
import 'package:flutter/material.dart';

class DataBackupLoadingRestor extends StatefulWidget {
  const DataBackupLoadingRestor({Key? key}) : super(key: key);

  @override
  State<DataBackupLoadingRestor> createState() => _DataBackupLoadingRestorState();
}

class _DataBackupLoadingRestorState extends State<DataBackupLoadingRestor> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DataBackupRestore(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Widget FourBoxes() {
      return Container(
        height: height * 0.18,
        width: width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient:
                LinearGradient(colors: [Color(0xFF1DBF73), Color(0xFF00ACEE)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFE8E8E8)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFE8E8E8)),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFE8E8E8)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFE8E8E8)),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: NaviBar(),
      drawer: MyDrawer(),
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.blueAccent,
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
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 110.0),
                        child: Text(
                          "Data Backup",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Roboto',
                              color: Color(0XFF191D21),
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FourBoxes(),
              SizedBox(
                height: height * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     PageTransition(
                  //         type: PageTransitionType.rightToLeft,
                  //         reverseDuration: Duration(seconds: 1),
                  //         duration: Duration(seconds: 1),
                  //         child: Databack()));
                },
                child: SizedBox(
                  width: width * 0.8,
                  height: height * 0.06,
                  child: Container(
                    width: 337,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(2, 2),
                            blurRadius: 42)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Images / Videos',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.5),
                        ),
                        SizedBox(
                          width: width * 0.25,
                        ),
                        Icon(
                          Icons.check_box,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.011,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     PageTransition(
                  //         type: PageTransitionType.rightToLeft,
                  //         reverseDuration: Duration(seconds: 1),
                  //         duration: Duration(seconds: 1),
                  //         child: Databack()));
                },
                child: SizedBox(
                  width: width * 0.8,
                  height: height * 0.06,
                  child: Container(
                    width: 337,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(2, 2),
                            blurRadius: 42)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Files',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.5),
                        ),
                        SizedBox(
                          width: width * 0.47,
                        ),
                        Icon(
                          Icons.check_box,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.011,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     PageTransition(
                  //         type: PageTransitionType.rightToLeft,
                  //         reverseDuration: Duration(seconds: 1),
                  //         duration: Duration(seconds: 1),
                  //         child: Databack()));
                },
                child: SizedBox(
                  width: width * 0.8,
                  height: height * 0.06,
                  child: Container(
                    width: 337,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(2, 2),
                            blurRadius: 42)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Contacts',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.5),
                        ),
                        SizedBox(
                          width: width * 0.39,
                        ),
                        Icon(
                          Icons.check_box,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.011,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     PageTransition(
                  //         type: PageTransitionType.rightToLeft,
                  //         reverseDuration: Duration(seconds: 1),
                  //         duration: Duration(seconds: 1),
                  //         child: Databack()));
                },
                child: SizedBox(
                  width: width * 0.8,
                  height: height * 0.06,
                  child: Container(
                    width: 337,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(2, 2),
                            blurRadius: 42)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Call log',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.5),
                        ),
                        SizedBox(
                          width: width * 0.43,
                        ),
                        Icon(
                          Icons.check_box,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.011,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     PageTransition(
                  //         type: PageTransitionType.rightToLeft,
                  //         reverseDuration: Duration(seconds: 1),
                  //         duration: Duration(seconds: 1),
                  //         child: Databack()));
                },
                child: SizedBox(
                  width: width * 0.8,
                  height: height * 0.06,
                  child: Container(
                    width: 337,
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(2, 2),
                            blurRadius: 42)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'App Data',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.5),
                        ),
                        SizedBox(
                          width: width * 0.4,
                        ),
                        Icon(
                          Icons.check_box,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Make sure your mobile is connected with system",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Advent Pro'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: width * 0.79,
                  height: height * 0.06,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xFF1DBF73),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      primary: Colors.white,
                      elevation: 6,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => BackupLoadingBR(),
                      //     ));
                    },
                    child: const Text(
                      "Make a backup",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                Image.asset(
                  "assets/Gif/loading.gif",
                  height: height * 0.1,
                  width: width * 0.6,
                ),
                Text(
                  "This process take time\nJust wait",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Roboto", fontSize: 12, letterSpacing: 0.5),
                ),
                SizedBox(
                  height: height * 0.15,
                ),
                Text(
                  "10%",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 30,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
