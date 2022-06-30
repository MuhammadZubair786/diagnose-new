
import 'package:diagnose/appointments_screens/appoinment_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppoinmentModal extends StatefulWidget {
  const AppoinmentModal({Key? key}) : super(key: key);

  @override
  State<AppoinmentModal> createState() => _AppoinmentModalState();
}

class _AppoinmentModalState extends State<AppoinmentModal> {
  static List<Color> colorsList = [
    Color(0xFFCBE3FF),
    Color(0xFFD9FFF8),
    Color(0xFFCBE3FF),
    Color(0xFFFFF3B6),
    Color(0xFFFFD1B6),
    Color(0xFFe5ffe0),
    Color(0xFFe0ffe1),
  ];
  static List<String> shopno = [
    "Shop 1",
    "Shop 2",
    "Shop 3",
    "Shop 4",
    "Shop 5",
    "Shop 6",
    "Shop 7",
  ];
  static List pictures = [
    "assets/pic1.png",
    "assets/pic2.png",
    "assets/pic3.png",
    "assets/pic4.png",
    "assets/pic5.png",
    "assets/pic6.png",
    "assets/pic7.png",
  ];
  final List allData = List.generate(
    shopno.length,
    (index) => AppoinmentData(
        image: pictures[index],
        rate: "\$500",
        description: "Discover new places and find new adventures.",
        shopNo: shopno[index]),
  );

  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: allData.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/BookAppoinment", arguments: {
              "Shop_no": shopno[index],
              "Images": pictures[index],
            });
          },
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            child: SizedBox(
              height: 52.h,
              width: mediaQueryWidth * 0.9,
              child: Card(
                elevation: 15,
                shadowColor: Colors.blue.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r)),
                child: Row(
                  children: [
                    Container(
                      child: Center(
                          child: Image.asset(
                        allData[index].image,
                        height: mediaQueryHeight * 0.08,
                      )),
                      decoration: BoxDecoration(
                        color: colorsList[index],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.r),
                          topLeft: Radius.circular(40.r),
                        ),
                      ),
                      height: 52.h,
                      width: mediaQueryWidth * 0.3,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 15.w,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: Row(
                                children: [
                                  Text(
                                    allData[index].shopNo,
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Color(0xFF191D21)),
                                  ),
                                  SizedBox(
                                    width: mediaQueryWidth * 0.25,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          right: 15.w, top: 4.h),
                                      child: Container(
                                        height: mediaQueryHeight * 0.03,
                                        width: mediaQueryWidth * 0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
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
                                            allData[index].rate,
                                            style: TextStyle(
                                                fontFamily: "Roboto",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                color: Color(0xFFFFFFFF)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "Discover new places\nand find new\nadventures.",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xFF656F77)),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
