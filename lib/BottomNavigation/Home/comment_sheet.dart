import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:blingo2/Components/entry_field.dart';
import 'package:blingo2/Locale/locale.dart';
import 'package:blingo2/Theme/colors.dart';

class Comment {
  final String? image;
  final String? name;
  final String? comment;
  final String? time;

  Comment({this.image, this.name, this.comment, this.time});
}

var userget1;

TextEditingController com = TextEditingController();
void commentSheet(BuildContext context, image, videouid) async {
  var locale = AppLocalizations.of(context)!;

  var userget = [];

  List<Comment> comments = [
    Comment(
      image: 'assets/user/user4.png',
      name: 'Emila Wattson',
      comment: locale.comment4,
      time: ' 2' + locale.dayAgo!,
    ),
  ];

  user() async {
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    //  print(data.data());

    return [data.data()];
  }

  sendComment() async {
    userget1 = FirebaseAuth.instance.currentUser!.uid;

    print(com.text);
    print(image.toString());

    DatabaseReference db =
        FirebaseDatabase.instance.reference().child("Videos");

    var key = db
        .child(videouid.toString())
        .child(image.toString().substring(0, image.toString().length - 5))
        .push();
    await db
        .child(videouid.toString())
        .child(image.toString().substring(0, image.toString().length - 5))
        .child("comment")
        .child(key.key.toString())
        .update({
      "comment": com.text,
      "user_uid": FirebaseAuth.instance.currentUser!.uid,
      "Video_Name": image.toString().substring(0, image.toString().length - 5),
      "Comment_User_Uid": FirebaseAuth.instance.currentUser!.uid,
      "Comment_Id": key.key
    });
  }

  getcomment() {
    var data = [];
    DatabaseReference db =
        FirebaseDatabase.instance.reference().child("Videos");
    var com1 = db
        .child(videouid.toString())
        .child(image.toString().substring(0, image.toString().length - 5))
        .child("comment")
        .once().then((snapshot) {
          // print(snapshot.snapshot.value);
           var values = snapshot.snapshot.value as Map;
           print()

            //   values.values.forEach((values) {
            //       var getdata = values.values.toList();
            //       for (var i = 0; i < getdata.length; i++) {
            //   // print(getdata[i]);

            // print(getdata[i]);
            //  }
            //   });
        });
    
  }

  await showModalBottomSheet(
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: backgroundColor,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          borderSide: BorderSide.none),
      context: context,
      builder: (context) => Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Stack(
              children: <Widget>[
                FadedSlideAnimation(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          locale.comments!,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: lightTextColor),
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future: getcomment(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.only(bottom: 60.0),
                                itemCount: comments.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: <Widget>[
                                      Divider(
                                        color: darkColor,
                                        thickness: 1,
                                      ),
                                      ListTile(
                                        leading: Image.asset(
                                          comments[index].image!,
                                          scale: 2.3,
                                        ),
                                        title: Text(comments[index].name!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2!
                                                .copyWith(
                                                    height: 2,
                                                    color: disabledTextColor)),
                                        subtitle: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: comments[index].comment,
                                            ),
                                            TextSpan(
                                                text: comments[index].time,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption),
                                          ]),
                                        ),
                                        trailing: ImageIcon(
                                          AssetImage(
                                              'assets/icons/ic_like.png'),
                                          color: disabledTextColor,
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                      )
                    ],
                  ),
                  beginOffset: Offset(0, 0.3),
                  endOffset: Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
                FutureBuilder(
                  future: user(),
                  builder: (context, snapshot) {
                    print(snapshot.data);

                    if (snapshot.hasData) {
                      // print(snapshot.data );
                      var data = snapshot.data as List;
                      // print(data[0]["photoUrl"]);
                      return Align(
                          alignment: Alignment.bottomCenter,
                          child: EntryField(
                            counter: null,
                            controller: com,
                            padding: EdgeInsets.zero,
                            hint: locale.writeYourComment,
                            fillColor: darkColor,
                            prefix: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    // FirebaseAuth.instance.currentUser!.photoURL!
                                    data[0]["photoUrl"]),
                              ),
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                sendComment();
                                // print(snapshot.data );
                              },
                              child: Icon(
                                Icons.send,
                                color: mainColor,
                              ),
                            ),
                          ));
                    } else {}
                    return Container();
                  },
                )
              ],
            ),
          ));
}
