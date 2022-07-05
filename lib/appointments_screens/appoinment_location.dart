
import 'package:diagnose/appointments_screens/appoinment_items.dart';
import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class AppoinmentLocation extends StatefulWidget {
  const AppoinmentLocation({Key? key}) : super(key: key);

  @override
  State<AppoinmentLocation> createState() => _AppoinmentLocationState();
}

class _AppoinmentLocationState extends State<AppoinmentLocation> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Widget countryList(String title, String subTitle) {
      return GestureDetector(
        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppointmentsItem(),
                            ),
                          );
                        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: SizedBox(
            height: height * 0.09,
            width: width * 0.9,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    title,
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 5),
                  child: Text(
                    subTitle,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color(0xFF656F77),
                    ),
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: IconButton(
                    onPressed: () {
                   
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppointmentsItem(),
                            ),
                          );
                       
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: NaviBar(),
      drawer: MyDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: AppBar(
          shadowColor: Colors.grey.withOpacity(0.7),
          elevation: 5,
          centerTitle: true,
          title: Padding(
              padding: EdgeInsets.only(right: 60),
              child: Image.asset(
                "assets/apbar.png",
                height: height * 0.04,
                width: width * 0.9,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 12.w, top: 5.h),
              child: Text(
                "Search City",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: const Color(0xFF223263)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 23.w, top: 5),
              child: Container(
                  height: height * 0.06,
                  width: width * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Color(0xFFACB8C2),),),
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    countryList("London", "10 Shops"),
                    countryList("Manchester", "19 Shops"),
                    countryList("Newcastle upon Tyne", "5 Shops"),
                    countryList("Newport (Welsh: Casnewydd)", "6 Shops"),
                    countryList("Bangor1", "8 Shops"),
                    countryList("Birmingham2", "15 Shops"),
                    countryList("London", "10 Shops"),
                    countryList("London", "10 Shops"),
                    countryList("London", "10 Shops"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
