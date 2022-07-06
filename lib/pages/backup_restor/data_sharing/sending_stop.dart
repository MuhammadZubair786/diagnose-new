import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:flutter/material.dart';

class SendingStop extends StatefulWidget {
  const SendingStop({Key? key}) : super(key: key);

  @override
  State<SendingStop> createState() => _SendingStopState();
}

class _SendingStopState extends State<SendingStop> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget dataList(String percentage) {
      return Container(
        width: width * 0.9,
        height: height * 0.05,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(218, 218, 218, 1),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "File Name",
                style: TextStyle(
                fontSize: 10,
                fontFamily: 'Advent Pro',
                color: Color(0xFF000000),
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w300),
              ),
              Text(
                "$percentage%",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Roboto",
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF000000)),
              ),
            ],
          ),
        ),
      );
    }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.2,
              ),
              Text(
                "Sending...",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Roboto",
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1DBF73)),
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                "Stop",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Roboto",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFC80101)),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          dataList("10"),
          SizedBox(
            height: height * 0.01,
          ),
          dataList("0"),
          SizedBox(
            height: height * 0.01,
          ),
          dataList("0"),
          SizedBox(
            height: height * 0.01,
          ),
          dataList("0"),
          SizedBox(
            height: height * 0.01,
          ),
          dataList("0"),
          SizedBox(
            height: height * 0.01,
          ),
          dataList("0"),
          SizedBox(
            height: height * 0.15,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "Wait this process take a time",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Advent Pro",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do not",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: "Advent Pro",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      " close",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: "Advent Pro",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFE6867),
                      ),
                    ),
                    Text(
                      " application",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: "Advent Pro",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          Text(
            "5%",
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
    );
  }
}
