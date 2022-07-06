import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:diagnose/pages/backup_restor/data_sharing/reciving_stop.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RecievingData extends StatefulWidget {
  const RecievingData({Key? key}) : super(key: key);

  @override
  State<RecievingData> createState() => _RecievingDataState();
}

class _RecievingDataState extends State<RecievingData> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: NaviBar(),
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
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: height * 0.65,
              ),
              Center(
                child: Text(
                  "Wait this process take a time\nDo not close application.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Advent Pro",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.7)),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Text(
                  "Reciving...",
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: "Roboto",
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1DBF73)),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.3,
            ),
            Container(
              height: height * 0.15,
              width: width * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 10)
                  ],
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Request for sahring\ndata",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: "Advent Pro",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  GestureDetector(
                    onTap: (){
                     Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.topToBottom,
                          reverseDuration: Duration(seconds: 1),
                          duration: Duration(seconds: 1),
                          child: RecievingStop()));
                    },
                    child: Text(
                      "Accept",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: "Advent Pro",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1DBF73),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.2,
            ),
            Text(
              "0%",
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: "Roboto",
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF191D21),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
