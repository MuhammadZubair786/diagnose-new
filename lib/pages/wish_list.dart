import 'package:diagnose/drawer.dart';
import 'package:diagnose/pages/About.dart';
import 'package:diagnose/pages/account2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:page_transition/page_transition.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: BottomNavbar(),
      drawer: MyDrawer(),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      reverseDuration: Duration(seconds: 1),
                      duration: Duration(seconds: 1),
                      child: About(),
                    ),
                  );
                },
                child: Icon(
                  Icons.help_outline,
                  color: Colors.black,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 3),
                child: Center(
                    child: Text("Wish List",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),),),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.16,
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    
                    border: Border.all(color: Color(0xFFEBF0FF)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10, left: 5),
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/13promax.jpeg",
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height:
                                        MediaQuery.of(context).size.height * 0.45,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: width * 0.4,
                                          child: Text(
                                            "Iphone 13 Pro Max #\n Repaired",
                                            style: TextStyle(
                                                color: Color(0xFF223263),
                                                fontFamily: "Roboto",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.1,
                                          child: Icon(
                                            Icons.favorite,
                                            size: 25,
                                            color: Colors.pink[500],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.01,
                                          child: Icon(
                                            Icons.delete_outlined,
                                            size: 25,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 28,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 10),
                                        child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            child: Text(
                                              "\$12344",
                                              style:
                                                  TextStyle(color: Colors.green),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 20),
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 5),
                                        child: Container(
                                            color: Colors.grey[200],
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06,
                                            child: Center(
                                              child: Text(
                                                "1",
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 7),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: height * 0.16,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFEBF0FF),
                    ),
                    borderRadius: BorderRadius.circular(5),
                    
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10, left: 5),
                                height: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/13promax.jpeg",
                                    width: width * 0.3,
                                    height: height * 0.45,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: width * 0.4,
                                          child: Text(
                                            "Iphone 13 Pro Max #\n Repaired",
                                            style: TextStyle(
                                                color: Color(0xFF223263),
                                                fontFamily: "Roboto",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: SizedBox(
                                          width: width * 0.1,
                                          child: Icon(
                                            Icons.favorite,
                                            size: 25,
                                            color: Colors.pink[500],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: SizedBox(
                                          width: width * 0.01,
                                          child: Icon(
                                            Icons.delete_outlined,
                                            size: 25,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 10),
                                        child: SizedBox(
                                            width: width * 0.3,
                                            child: Text(
                                              "\$12344",
                                              style:
                                                  TextStyle(color: Colors.green),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 5.0, left: 20),
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 5),
                                        child: Container(
                                            color: Colors.grey[200],
                                            width: width * 0.06,
                                            child: Center(
                                              child: Text(
                                                "1",
                                                style: TextStyle(
                                                    color: Colors.green),
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5.0, left: 7),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 9),
                  width: width * 0.645,
                  height: height * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                      
                  child: TextField(
                    style: TextStyle(color: Colors.green),
                    decoration: InputDecoration(
                      hoverColor: Colors.red,
                      hintStyle: TextStyle(
                          color: Color(0xFF9098B1),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey.withOpacity(0.6)),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      hintText: "Enter Cupon Code",
                    ),
                    maxLines: 5,
      
                    // enabled: false,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 0),
                  width: width * 0.3,
                  height: height * 0.08,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // ignore: prefer_const_constructors
                    border: Border.all(
                      width: 1,
                      color: Color(0xFF1DBF73).withOpacity(0.6),
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: Center(
                    child: Text("Apply"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  
                  border: Border.all(color: Color(0xFF9098B1).withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "Items (3)",
                              style: TextStyle(color: Color(0xFF9098B1)),
                            )),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "\$598.86",
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "Shiping",
                              style: TextStyle(color: Color(0xFF9098B1)),
                            )),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "\$40.86",
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "import Charges",
                              style: TextStyle(color: Color(0xFF9098B1)),
                            )),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "\$128.00",
                              style: TextStyle(color: Colors.black),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "Total Price ",
                              style: TextStyle(color: Colors.black),
                            )),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text(
                              "\$766.86",
                              style: TextStyle(color: Color(0xFF40BFFF)),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.004,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Account2(),
                    ),
                  );
                },
                child: Card(
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.934,
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
                      width: width * 0.92,
                      alignment: Alignment.center,
                      child: Text(
                        "Check Out",
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
