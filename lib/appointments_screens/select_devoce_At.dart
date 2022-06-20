import 'package:diagnose/appointments_screens/appoinment_items.dart';
import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:diagnose/responsive_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDeviceAT extends StatefulWidget {
  const SelectDeviceAT({Key? key}) : super(key: key);

  @override
  State<SelectDeviceAT> createState() => _SelectDeviceATState();
}

class _SelectDeviceATState extends State<SelectDeviceAT> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: const AppointmentScreenA(),
          desktop: const AppointmentScreenA(),
          tablet: const AppointmentScreenA(),
        ),
      ),
    );
  }
}

class AppointmentScreenA extends StatefulWidget {
  const AppointmentScreenA({Key? key}) : super(key: key);

  @override
  State<AppointmentScreenA> createState() => _AppointmentScreenAState();
}

class _AppointmentScreenAState extends State<AppointmentScreenA> {
  @override
  Widget build(BuildContext context) {
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    double mediaQueryheight = MediaQuery.of(context).size.height;

    Widget expandListContainer(String listTitle, String listData) {
      return SizedBox(
        width: mediaQueryWidth * 0.2,
        height: mediaQueryheight * 0.05,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(11.r)),
          elevation: 20,
          shadowColor: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                listData,
                style: TextStyle(
                    fontFamily: "Advent Pro",
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF000000)),
              ),
            ],
          ),
        ),
      );
    }

    Widget expandedData(String listTitle, String listData) {
      return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        elevation: 20,
        shadowColor: Colors.grey,
        child: ExpansionTile(
          children: [
            Container(
              width: mediaQueryWidth * 1,
              height: mediaQueryheight * 0.001,
              color: Colors.grey.withOpacity(0.3),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                expandListContainer(listTitle, listData),
                expandListContainer(listTitle, listData),
                expandListContainer(listTitle, listData),
                expandListContainer(listTitle, listData),
              ],
            )
          ],
          trailing: Image(
            height: mediaQueryheight * 0.03,
            width: mediaQueryheight * 0.03,
            image: const AssetImage("assets/expandedicon.png"),
          ),
          title: Text(
            listTitle,
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF000000)),
          ),
        ),
      );
    }

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
                height: mediaQueryheight * 0.04,
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
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: 32.w, right: 47.w),
          child: Column(
            children: [
              SizedBox(
                height: mediaQueryheight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select device",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color(0xFF223263)),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AppointmentsItem(),
                          ),
                        );
                      },
                      child: Text(
                        "Appointments",
                        style: TextStyle(
                          fontFamily: "Advent Pro",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mediaQueryheight * 0.0001,
              ),
              expandedData("Device", "Touch"),
              SizedBox(
                height: mediaQueryheight * 0.01,
              ),
              expandedData("Company", "Touch"),
              SizedBox(
                height: mediaQueryheight * 0.01,
              ),
              expandedData("Model Number", "Touch"),
              SizedBox(
                height: mediaQueryheight * 0.01,
              ),
              expandedData("Services", "Touch"),
              SizedBox(
                height: mediaQueryheight * 0.01,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 20,
                shadowColor: Colors.grey,
                child: Container(
                  height: mediaQueryheight * 0.2,
                  width: mediaQueryWidth * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    maxLines: 200,
                    decoration: const InputDecoration(
                        border:  OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: "Address :"),
                  ),
                ),
              ),
              SizedBox(
                height: mediaQueryheight * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppointmentsItem(),
                    ),
                  );
                },
                child: Card(
                  child: Container(
                    height: mediaQueryheight * 0.06,
                    width: mediaQueryWidth * 0.99,
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
                      height: mediaQueryheight * 0.058,
                      width: mediaQueryWidth * 0.88,
                      alignment: Alignment.center,
                      child: Text(
                        "Search Near Shop",
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
    );
  }
}
