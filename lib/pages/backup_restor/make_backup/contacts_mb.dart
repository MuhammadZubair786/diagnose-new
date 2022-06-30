import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:localstorage/localstorage.dart';

class ContactMB extends StatefulWidget {
  const ContactMB({Key? key}) : super(key: key);

  @override
  State<ContactMB> createState() => _ContactMBState();
}

class _ContactMBState extends State<ContactMB> {
  List<Contact>? contacts;
  final LocalStorage storage = LocalStorage("Localstorage_app");

  var value1 = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
  }

  void getContact() async {
    await Permission.contacts.request();

    final PermissionStatus permission = await Permission.contacts.status;
    print("permission :" + permission.toString());

    if (permission.isDenied) {
      print("permission :" + permission.toString());
      Permission.contacts.request();
    } else if (permission.isGranted) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      // print(contacts);

      var contactlist = [];

      for (var i = 0; i < 100; i++) {
        // print(contacts![i].phones.first.number);

        if (contacts![i].phones.first.number != null) {
          var username = contacts![i].name.first + contacts![i].name.last;
          var number = contacts![i].phones.first.number;

          if (username == "" || username == null) {
            username = "user";
          }
          if (number == "" || number == null) {
            number = "no number";
          }

          contactlist.add({"name": username, "number": number});
        }
      }
      await storage.setItem('Contact', contactlist);

      setState(() {});
    }
  }

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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Container(
                                  child: Text(
                                "Contacts",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Container(
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ]))),
              SizedBox(
                height: height * 0.04,
              ),
              (contacts) == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: contacts!.length,
                      itemBuilder: (BuildContext context, int index) {
                        // print(contacts![index].phones.first.number);
                        var username = contacts![index].name.first +
                            contacts![index].name.last;
                        var ischeck = false;
                        // print(username);
                        // print(username.length);
                        return
                            // Container(
                            //   width: width * 0.9,
                            //   height: height * 0.05,
                            //   decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: Color.fromRGBO(218, 218, 218, 1),
                            //       width: 1,
                            //     ),
                            //   ),
                            //   child: Row(
                            //     children: [
                            //       Padding(
                            //         padding: const EdgeInsets.only(left: 10.0),
                            //         child: Container(
                            //             child: contacts![index].name.first != null ||  contacts![index].name.last!=null ? Text(
                            //        '${contacts![index].name.first} ${contacts![index].name.last}',
                            //           // ignore: prefer_const_constructors
                            //           style: TextStyle(
                            //               fontSize: 12,
                            //               fontFamily: 'Advent Pro',
                            //               color: Colors.black,
                            //               decoration: TextDecoration.none,
                            //               fontWeight: FontWeight.w500),
                            //         ):Text("user"),
                            //         )
                            //       ),
                            //       SizedBox(
                            //         width: width * 0.18,
                            //       ),
                            //       Padding(
                            //         padding: const EdgeInsets.only(left: 10.0),
                            //         child:
                            //          contacts![index].phones.first.number != null ? Container(
                            //             child: Text(
                            //           contacts![index].phones.first.number,
                            //           style: TextStyle(
                            //               fontSize: 12,
                            //               fontFamily: 'Advent Pro',
                            //               color: Colors.black,
                            //               decoration: TextDecoration.none,
                            //               fontWeight: FontWeight.w500),
                            //         )):
                            //         Text("data"),
                            //       ),
                            //       SizedBox(
                            //         width: width * 0.27,
                            //       ),
                            //       Container(
                            //         child: Icon(
                            //           Icons.check_box,
                            //           color: Colors.green,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            ListTile(
                          leading: contacts![index].name.first == null
                              ? Text(
                                  "User",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              : username.length > 15
                                  ? Text(
                                      username.substring(
                                          0, username.length - 5),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                  : Text(username,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),

                          // title: ,
                          title: Center(
                              child:
                                  contacts![index].phones.first.number == null
                                      ? Text("No number ")
                                      : Text(
                                          '${contacts![index].phones.first.number}',
                                        )),
                          trailing: Checkbox(
                            value: ischeck,
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                ischeck = value!;
                                print(value);
                              });
                            },
                          ),
                          // trailing:   entry.callType== CallType.missed ?   Icon(Icons.phone_callback,color: Colors.red,):
                          // Icon(Icons.phone_callback,color: Colors.green,),
                        );
                      })
            ],
          ),
        ),
      ),
    );
  }
}
