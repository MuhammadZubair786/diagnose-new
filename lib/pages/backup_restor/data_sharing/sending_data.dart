import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:diagnose/pages/backup_restor/data_sharing/sending_stop.dart';
import 'package:flutter/material.dart';

class SendingData extends StatefulWidget {
  const SendingData({Key? key}) : super(key: key);

  @override
  _SendingDataState createState() => _SendingDataState();
}

class _SendingDataState extends State<SendingData> {
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
              icon: Icon(
                Icons.apps,
                color: Colors.black,
              ),
            );
          }),
        ),
        body: Column(children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/icon.png",
                      height: height * 0.02,
                      width: width * 0.2,
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 150.0),
                  child: Text(
                    "Send",
                    style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                    decoration: TextDecoration.none),
                  ),
                ),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Image.asset("assets/Gif/waves.gif"),
          ),
          SizedBox(
            height: height * 0.03,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SendingStop(),
                      ));
                },
                child: const Text(
                  "Search again",
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
        ]));
  }
}
