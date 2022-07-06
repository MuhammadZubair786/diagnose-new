// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter_archive/flutter_archive.dart';
//import package files

//apply this class on home: attribute at MaterialApp()
class FileMB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FileMB();
  }
}

class _FileMB extends State<FileMB> {
  var files = [];


//  Future<Directory?> appDocDirectory = getExternalStorageDirectory();
//     // print(appDocDirectory);
//     var encoder = ZipFileEncoder();
    
    // encoder.create(appDocDirectory!.path + "/" + 'jay.zip');



  // void initState(){
  //   super.initState();

  // }

  Future<void> handlerpermssion() async {
    var permission = await Permission.storage;

    if (permission.status == PermissionStatus.granted) {
      print("Permsiion");
      getFiles();
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
    var fm = FileManager(root: Directory(root));

    print(fm); 

    files = await fm.filesTree(
        //set fm.dirsTree() for directory/folder tree list
        excludedPaths: [
          "/storage/emulated/0/Android"
        ], extensions: [
      // "png",
      "pdf",
      // "docx"
    ] 
        );
    print(files[0].runtimeType);
    Directory? appDocDirectory = await getExternalStorageDirectory();
    print(appDocDirectory);
    var encoder = ZipFileEncoder();
    // encoder.create(appDocDirectory!.path + "/" + 'newFile.zip');
     encoder.open(appDocDirectory!.path + "/" + 'newFile.zip');

    


     setState(() {
      
    });
    // }
   await encoder.addFile(files[10]);
   await  encoder.addFile(files[1]);
  await  encoder.addFile(files[2]);
  await    encoder.addFile(files[3]);
    await encoder.addFile(files[4]);
   await  encoder.addFile(files[5]);
   await  encoder.addFile(files[6]);
   await   encoder.addFile(files[7]);
  await  encoder.addFile(files[8]);
   await encoder.addFile(files[9]);
    encoder.addFile(files[0]);
    encoder.addFile(files[11]);
    encoder.addFile(files[12]);
     encoder.addFile(files[13]);
    encoder.addFile(files[14]);
    encoder.addFile(files[15]);
    encoder.addFile(files[16]);
     encoder.addFile(files[17]);
    encoder.addFile(files[18]);
     encoder.addFile(files[19]);
    encoder.addFile(files[20]);
   
    

   

    encoder.close();
 
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
                icon: const Positioned(
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
                                // ignore: avoid_unnecessary_containers
                                child: Container(
                                  
                                    child: Text(
                                  "Files",
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
                    itemBuilder: (context, index) {
                      return
                      Column(
                        children : [
                       Makefile(index),
                       Divider(),
                       
                       ]);
                        
                    }),
              ],
            ),
          ),
        ));
  }


  Makefile(int index) {
    return ListTile(
      leading:Text(files[index].path.split('/').last.toString()),
      // ignore: prefer_const_constructors
      trailing: GestureDetector(
        onTap: (){
          getfile(files[index]);
        },
        child: Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.grey,
                ),
      ),
      
      );
  }
  
   getfile(var chk) async {
    print(chk);
    
    // files.forEach((element) async { 
    //   var data = await encoder.addFile(files[files[element]]);
    //   print(element);
      

    // });

    // var data = encoder.addFile(chk);
    // print(data);

  }
}
