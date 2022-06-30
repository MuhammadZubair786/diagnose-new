import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:flutter/material.dart';

class CallLogREstore extends StatefulWidget {
  const CallLogREstore({Key? key}) : super(key: key);

  @override
  State<CallLogREstore> createState() => _CallLogREstoreState();
}

class _CallLogREstoreState extends State<CallLogREstore> {
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
                child: Row(children: [
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
                  SizedBox(
                    width: width * 0.20,
                  ),
                  Container(
                      child: Text(
                    "Call Logs",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Roboto',
                        color: Colors.black,
                        decoration: TextDecoration.none),
                    textAlign: TextAlign.center,
                  )),
                ]))),
        SizedBox(
          height: height * 0.04,
        ),
        Container(
          width: width * 0.9,
          height: height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(218, 218, 218, 1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "Name 1",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "03152952995",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.27,
              ),
              Container(
                  child: Image.asset(
                "assets/greencall.png",
                height: 20,
                width: 20,
              )),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          width: width * 0.9,
          height: height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(218, 218, 218, 1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "Name 1",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "03152952995",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.27,
              ),
              Container(
                  child: Image.asset(
                "assets/redcall.png",
                height: 20,
                width: 20,
              )),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          width: width * 0.9,
          height: height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(218, 218, 218, 1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "Name 1",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "03152952995",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.27,
              ),
              Container(
                  child: Image.asset(
                "assets/redcall.png",
                height: 20,
                width: 20,
              )),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          width: width * 0.9,
          height: height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(218, 218, 218, 1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "Name 1",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "03152952995",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.27,
              ),
              Container(
                  child: Image.asset(
                "assets/greencall.png",
                height: 20,
                width: 20,
              )),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          width: width * 0.9,
          height: height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(218, 218, 218, 1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "Name 1",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "03152952995",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.27,
              ),
              Container(
                  child: Image.asset(
                "assets/redcall.png",
                height: 20,
                width: 20,
              )),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          width: width * 0.9,
          height: height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(218, 218, 218, 1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "Name 1",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "03152952995",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.27,
              ),
              Container(
                  child: Image.asset(
                "assets/redcall.png",
                height: 20,
                width: 20,
              )),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          width: width * 0.9,
          height: height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(218, 218, 218, 1),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "Name 1",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                    child: Text(
                  "03152952995",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Advent Pro',
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w500),
                )),
              ),
              SizedBox(
                width: width * 0.27,
              ),
              Container(
                  child: Image.asset(
                "assets/redcall.png",
                height: 20,
                width: 20,
              )),
            ],
          ),
        ),
      ])),
    );
  }
}
