import 'dart:io';
import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'package:permission_handler/permission_handler.dart';
//import package files

//apply this class on home: attribute at MaterialApp()
class FileMB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FileMB();
  }
}

class _FileMB extends State<FileMB> {
  var files=[];

  // void initState(){
  //   super.initState();

  // }

  Future<void> handlerpermssion() async {
    var permission = await Permission.storage;

    if (permission.status == PermissionStatus.granted) {
      print("Permsiion");
    } else {
      await Permission.storage.request();

      getFiles();
    }
  }

  void getFiles() async {
    //asyn function to get list of files
    List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    var root = storageInfo[0]
        .rootDir; //storageInfo[1] for SD card, geting the root directory
    var fm = FileManager(root: Directory(root)); //
    files = await fm.filesTree(
        //set fm.dirsTree() for directory/folder tree list
        excludedPaths: [
          "/storage/emulated/0/Android"
        ], extensions: [
      "png",
      "pdf",
      "docx"
    ] //optional, to filter files, remove to list all,
        //remove this if your are grabbing folder list
        );
    print(files);
    setState(() {}); //update the UI
  }

  @override
  void initState() {
    //call getFiles() function on initial state.
    super.initState();
    handlerpermssion();
  }

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
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
        body:  SingleChildScrollView(
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
                                    child: files == null
                                        ? Text("0")
                                        : Text(files.length.toString(),
                                            style: TextStyle(fontSize: 20))),
                              ),
                            ]))),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: files.length,
                itemBuilder: (context, index){
                  return   Makefile(index);
               
                }),
            ],
          ),
        ),
        )
    );
  }

 Makefile(int index) {
    return Card(
      child: Container(child: Text(files[index].path.split('/').last.toString())));
  }
}
