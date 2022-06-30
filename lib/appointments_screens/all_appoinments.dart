import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:flutter/material.dart';

class AllApoinments extends StatefulWidget {
  const AllApoinments({Key? key}) : super(key: key);

  @override
  State<AllApoinments> createState() => _AllApoinmentsState();
}

class _AllApoinmentsState extends State<AllApoinments> {
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
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget container(
      String image,
      String name,
    ) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shop Name",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
            ),
            Text(
              "Time / Date",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w300,
                fontSize: 10,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/CancelAppoinment",
                    arguments: {"images": image, "shop_No": name});
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                    color: Color(0xFFFE6867)),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: NaviBar(),
      appBar: AppBar(
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
          "All Appoinment",
          style: TextStyle(
              color: Color(0xFF191D21),
              fontSize: 24,
              fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.06,
                width: width * 0.84,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFDADADA),
                  ),
                ),
                child: container(
                  pictures[0],
                  shopno[0],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.06,
                width: width * 0.84,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFDADADA),
                  ),
                ),
                child: container(
                  pictures[1],
                  shopno[1],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.06,
                width: width * 0.84,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFDADADA),
                  ),
                ),
                child: container(
                  pictures[2],
                  shopno[2],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.06,
                width: width * 0.84,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFDADADA),
                  ),
                ),
                child: container(
                  pictures[3],
                  shopno[3],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
