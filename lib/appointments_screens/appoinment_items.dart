
import 'package:diagnose/appointments_screens/appoinment_data.dart';
import 'package:diagnose/appointments_screens/appoinment_location.dart';
import 'package:diagnose/appointments_screens/appoinments_modal_class.dart';
import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:diagnose/responsive_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentsItem extends StatefulWidget {
  const AppointmentsItem({Key? key}) : super(key: key);

  @override
  State<AppointmentsItem> createState() => _AppointmentsItemState();
}

class _AppointmentsItemState extends State<AppointmentsItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: const AppointmentsItemA(),
          desktop: const AppointmentsItemA(),
          tablet: const AppointmentsItemA(),
        ),
      ),
    );
  }
}

class AppointmentsItemA extends StatefulWidget {
  const AppointmentsItemA({Key? key}) : super(key: key);

  @override
  State<AppointmentsItemA> createState() => _AppointmentsItemAState();
}

class _AppointmentsItemAState extends State<AppointmentsItemA> {

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

    return Scaffold(
      drawer: MyDrawer(),
      bottomNavigationBar: NaviBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: AppBar(
          shadowColor: Colors.grey.withOpacity(0.7),
          elevation: 5,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mobile_friendly,
                  color: Colors.black,
                ))
          ],
          title: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Image.asset(
                "assets/apbar.png",
                height: mediaQueryHeight * 0.04,
                width: mediaQueryWidth * 0.9,
              )),
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
          backgroundColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 12.w, top: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Appointments",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: const Color(0xFF223263)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AppoinmentLocation(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 110.w),
                            child: Text(
                              "Current",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color(0xFF223263),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: const Icon(
                              Icons.location_pin,
                              size: 13,
                              color:  Color(0xFF1DBF73),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 23.w),
                child: Container(
                    height: mediaQueryHeight * 0.06,
                    width: mediaQueryWidth * 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Color(0xFFACB8C2),
                        )),
                    child: Center(
                      child: TextFormField(
                        autocorrect: true,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.grey.withOpacity(0.8),
                              )),
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: const Color(0xFF656F77),
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(right: 385.w),
                child: Text(
                  "Near shop’s",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF191D21)),
                ),
              ),
              AppoinmentModal()
            ],
          ),
        ),
      ),
    );
  }
}
