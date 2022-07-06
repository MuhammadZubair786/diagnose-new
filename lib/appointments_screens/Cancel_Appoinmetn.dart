import 'package:diagnose/appointments_screens/appoinment_items.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:page_transition/page_transition.dart';

class CancelAppoinment extends StatefulWidget {
  const CancelAppoinment({Key? key}) : super(key: key);

  @override
  State<CancelAppoinment> createState() => _CancelAppoinmentState();
}

class _CancelAppoinmentState extends State<CancelAppoinment> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var Data = ModalRoute.of(context)!.settings.arguments as Map;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget expandedData(
      String listTitle,
    ) {
      return SizedBox(
        height: height * 0.07,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          elevation: 20,
          shadowColor: Colors.grey,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 10, right: 8, top: 8, bottom: 8),
              child: Text(
                listTitle,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF000000)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 10, top: 8, bottom: 8),
              child: Image(
                height: height * 0.03,
                width: width * 0.05,
                image: const AssetImage("assets/expandedicon.png"),
              ),
            ),
          ]),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Appoinment",
            style: TextStyle(
                color: Color(0xFF191D21),
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: height * 0.39,
                  width: width * 0.84,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, top: 10, right: 2, bottom: 2),
                          child: Text(
                            "${Data["shop_No"]}",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF191D21)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 2,
                          ),
                          child: Text(
                            "Description about shop and detials ",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF656F77),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            top: 8,
                            right: 2,
                          ),
                          child: Image.asset(
                            "${Data["images"]}",
                            height: height * 0.22,
                            width: width * 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: 15.w, top: 5.h, left: 20.w),
                          child: Container(
                            height: height * 0.05,
                            width: width * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFF00ACEE),
                                  Color(0xFF1DBF73),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "\$500",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Color(0xFFFFFFFF)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 2,
                  right: 18,
                ),
                child: Column(
                  children: [
                    expandedData(
                      "Sunday",
                    ),
                    expandedData(
                      "Month",
                    ),
                    expandedData(
                      "Year",
                    ),
                    expandedData(
                      "Time",
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.topToBottom,
                      reverseDuration: const Duration(seconds: 1),
                      duration: const Duration(seconds: 1),
                      child: const AppointmentsItem(),
                    ),
                  );
                },
                child: Card(
                  child: Container(
                    height: height * 0.061,
                    width: width * 0.82,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                           Color(0xFF00ACEE),
                           Color(0xFF1DBF73),
                        ],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      height: height * 0.058,
                      width: width * 0.81,
                      alignment: Alignment.center,
                      child: Text(
                        "Cancel",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: const Color(0xFF000000)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: NaviBar(),
    );
  }
}
