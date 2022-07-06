// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:photo_manager/photo_manager.dart';

import 'package:diagnose/drawer.dart';
import 'package:diagnose/navbar/nav_bar_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';
import "package:localstorage/localstorage.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageVideosMB extends StatefulWidget {
  const ImageVideosMB({Key? key}) : super(key: key);
  
  

  @override
  State<ImageVideosMB> createState() => _ImageVideosMBState();
}

class _ImageVideosMBState extends State<ImageVideosMB> {
  List<Album>? _albums;
  bool _loading = false;
  
    List<AssetEntity> assets = [];


    Future<Uint8List> get thumbData {
      // TODO: implement thumbData
      throw UnimplementedError();
    }
    

  final LocalStorage storage = LocalStorage("Localstorage_app");
  

  @override
  void initState() {
    super.initState();
    _loading = true;
    initAsync();
  }

initAsync() async {
    if (await _promptPermissionSetting()) {

      

        final albums = await PhotoManager.getAssetPathList(onlyAll: true);
  final recentAlbum = albums.first;
  print(recentAlbum);
  final recentAssets = await recentAlbum.getAssetListRange(
    start: 0, // start at index 0
    end: 1000000, // end at a very big index (to get all the assets)
  );
  setState(() {
    assets=recentAssets;
       _loading = false;
  });

  // print(recentAssets);
//       List<Album> albums =
//           await PhotoGallery.listAlbums(mediumType: MediumType.image);
//     final Medium medium = await PhotoGallery.getMedium(
//   mediumId: "10", 
// );

//       print(medium);

//       // print(albums);
//       setState(() {
//         _albums = albums;
//         _loading = false;
//       });

      // var mediadata;

      // for (var i = 0; i < albums.length; i++) {
      //   MediaPage mediaPage = await albums[i].listMedia();
      //   mediadata = mediaPage.items;
      // }

      // mediadata as List;
      // for (var i = 0; i < mediadata.length; i++) {
      //   print(mediadata[i]
      //       .toString()
      //       .substring(6, mediadata[i].toString().length));
      //   var data = mediadata[i]
      //       .toString()
      //       .substring(6, mediadata[i].toString().length);
      //   print(data);
      //   await FirebaseFirestore.instance
      //       .collection("Data Store")
      //       .doc()
      //       .collection("Backup")
      //       .doc(i.toString())
      //       .set({"images": data});
      // }

      //
      // storage.setItem("Image_Albums",  mediadata as List);

      //  MediaPage mediaPage = await albums.listMedia();

      // for(var i=0;i<1;i++){
      //   // albums as Map;
      //   // print(albums[i].mediumType);
      //   // print(albums[i].id);
      //   // print(albums[i].count);
      //   // print(albums[i].name);
      //   // var obj={
      //   //   "Albums":albums[i].mediumType,
      //   //   "Count":albums[i].count,

      //   // };

      // //

      // }
    }
    setState(() {
      _loading = false;
    });
    return assets;
  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS &&
            await Permission.storage.request().isGranted &&
            await Permission.photos.request().isGranted ||
        Platform.isAndroid && await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          "Images/Videos",
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'Roboto',
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/icon.png",
              height: 30,
              width: 30,
            ),
          )
        ],
      ),
      body:
       FutureBuilder<Uint8List>(
      future: initAsync(),
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        // print(bytes);
        // If we have no data, display a spinner
        if (bytes == null) return CircularProgressIndicator();
        // If there's data, display it as an image
        return Image.memory(bytes);
      },
    )
    );
      // FutureBuilder(
      //   future:,
      //   builder: (context,),
      // )
      //  _loading
      //     ? Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : LayoutBuilder(
      //         builder: (context, constraints) {
      //           print(assets.length);
      //           double gridWidth = (constraints.maxWidth - 20) / 3;
      //           double gridHeight = gridWidth + 33;
      //           double ratio = gridWidth / gridHeight;
      //           return Container(
      //             padding: EdgeInsets.all(5),
      //             child: GridView.count(
      //               childAspectRatio: ratio,
      //               crossAxisCount: 3,
      //               mainAxisSpacing: 5.0,
      //               crossAxisSpacing: 5.0,
      //               children: <Widget>[
      //                 ...?_albums?.map(
      //                   (album) => GestureDetector(
      //                     onTap: () {
      //                       Navigator.of(context).push(MaterialPageRoute(
      //                           builder: (context) => AlbumPage(album)));
      //                     },
      //                     child: Column(
      //                       children: <Widget>[
      //                         ClipRRect(
      //                           borderRadius: BorderRadius.circular(5.0),
      //                           child: Container(
      //                             color: Colors.grey[300],
      //                             height: gridWidth,
      //                             width: gridWidth,
      //                             child: FadeInImage(
      //                               fit: BoxFit.cover,
      //                               placeholder: MemoryImage(kTransparentImage),
      //                               image: AlbumThumbnailProvider(
      //                                 albumId: album.id,
      //                                 mediumType: album.mediumType,
      //                                 highQuality: true,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         Container(
      //                           alignment: Alignment.topLeft,
      //                           padding: EdgeInsets.only(left: 2.0),
      //                           child: Text(
      //                             album.name ?? "Unnamed Album",
      //                             maxLines: 1,
      //                             textAlign: TextAlign.start,
      //                             style: TextStyle(
      //                               height: 1.2,
      //                               fontSize: 16,
      //                             ),
      //                           ),
      //                         ),
      //                         Container(
      //                           alignment: Alignment.topLeft,
      //                           padding: EdgeInsets.only(left: 2.0),
      //                           child: Text(
      //                             album.count.toString(),
      //                             textAlign: TextAlign.start,
      //                             style: TextStyle(
      //                               height: 1.2,
      //                               fontSize: 12,
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           );
      //         },
      //       ),
   
  }
}

class AlbumPage extends StatefulWidget {
  final Album album;

  AlbumPage(Album album) : album = album;

  @override
  State<StatefulWidget> createState() => AlbumPageState();
}

class AlbumPageState extends State<AlbumPage> {
  List<Medium>? _media;

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  void initAsync() async {
    MediaPage mediaPage = await widget.album.listMedia();
    setState(() {
      _media = mediaPage.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NaviBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: Builder(builder: (context) {
        //   return IconButton(
        //     onPressed: () {
        //       Scaffold.of(context).openDrawer();
        //     },
        //     icon: Positioned(
        //       top: 20,
        //       child: Icon(
        //         Icons.apps,
        //         color: Colors.black,
        //       ),
        //     ),
        //   );
        // }),
        title: Text(
          "Images/Videos",
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'Roboto',
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/icon.png",
              height: 30,
              width: 30,
            ),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: <Widget>[
          ...?_media?.map(
            (medium) => GestureDetector(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewerPage(medium))),
              child: Container(
                color: Colors.grey[300],
                child: FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: MemoryImage(kTransparentImage),
                  image: ThumbnailProvider(
                    mediumId: medium.id,
                    mediumType: medium.mediumType,
                    highQuality: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ViewerPage extends StatefulWidget {
  final Medium medium;

  ViewerPage(Medium medium) : medium = medium;

  @override
  State<ViewerPage> createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  @override
  Widget build(BuildContext context) {
    DateTime? date = widget.medium.creationDate ?? widget.medium.modifiedDate;
    return Scaffold(
      bottomNavigationBar: NaviBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: Builder(builder: (context) {
        //   return IconButton(
        //     onPressed: () {
        //       Scaffold.of(context).openDrawer();
        //     },
        //     icon: Positioned(
        //       top: 20,
        //       child: Icon(
        //         Icons.apps,
        //         color: Colors.black,
        //       ),
        //     ),
        //   );
        // }),
        title: Text(
          "Images/Videos",
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'Roboto',
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/icon.png",
              height: 30,
              width: 30,
            ),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: widget.medium.mediumType == MediumType.image
            ? FadeInImage(
                fit: BoxFit.cover,
                placeholder: MemoryImage(kTransparentImage),
                image: PhotoProvider(mediumId: widget.medium.id),
              )
            : VideoProvider(
                mediumId: widget.medium.id,
              ),
      ),
    );
  }
}

class VideoProvider extends StatefulWidget {
  final String mediumId;

  const VideoProvider({
    required this.mediumId,
  });

  @override
  _VideoProviderState createState() => _VideoProviderState();
}

class _VideoProviderState extends State<VideoProvider> {
  VideoPlayerController? _controller;
  File? _file;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      initAsync();
    });
    super.initState();
  }

  Future<void> initAsync() async {
    try {
      _file = await PhotoGallery.getFile(mediumId: widget.mediumId);
      _controller = VideoPlayerController.file(_file!);
      _controller?.initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    } catch (e) {
      print("Failed : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _controller == null || !_controller!.value.isInitialized
        ? Container()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    _controller!.value.isPlaying
                        ? _controller!.pause()
                        : _controller!.play();
                  });
                },
                child: Icon(
                  _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ],
          );
  }
}
