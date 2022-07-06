import 'dart:async';

import 'package:diagnose/auth/login.dart';
import 'package:diagnose/auth/login_loading.dart';
import 'package:diagnose/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();


  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  var pass1 = true;
  var pass2 = true;




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;



      Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile', 'user_birthday']
    );

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData();

    // userEmail = userData['email'];

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }




    signUpUser() async {
      var emailcont = email.text;
      var passcont = password.text;
      var namecont = name.text;
      var confcont = confirmpassword.text;
      if (emailcont == '' &&
          passcont == "" &&
          namecont == "" &&
          confcont == "") {
        final snackBar = const SnackBar(
          duration: const Duration(seconds: 5),
          content: Text('Empty All Field'),
          // action: SnackBarAction(
          //   label: 'Undo',
          //   onPressed: () {
          //     // Some code to undo the change.
          //   },
          // ),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (emailcont == '') {
        final snackBar = const SnackBar(
          content: Text('Enter Email'),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (passcont == '') {
        final snackBar = const SnackBar(
          content: Text('Enter Password'),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (namecont == '') {
        final snackBar = const SnackBar(
          content: Text('Enter User Name'),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (confcont == '') {
        final snackBar = const SnackBar(
          content: Text('Enter Confirm Password'),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (passcont != confcont) {
        final snackBar = const SnackBar(
          content: Text('Does Not Match Password And  Confirm Password'),
        );

        // Find the ScaffoldMessenger in the widget tree
        // and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        try {
          final FirebaseAuth _auth = FirebaseAuth.instance;
          await _auth
              .createUserWithEmailAndPassword(
                  email: emailcont, password: passcont)
              .then((value) async {
            print(value.user!.uid);
            final snackBar = const SnackBar(
              content: Text('Success User Account Created'),
            );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            await FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .set({
              'Username': namecont,
              'email': FirebaseAuth.instance.currentUser!.email!,
              'uid':FirebaseAuth.instance.currentUser!.uid
            });
            Timer(const Duration(seconds: 1), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            });
          });
        } catch (err) {
          print(err);
           final snackBar =  SnackBar(
          content: Text(err.toString()),
        );
         ScaffoldMessenger.of(context).showSnackBar(snackBar);
        
        }
      }
    }

GoogleSignup() async {

  try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential).then((value) async {
        String email =
            value.user!.email!.substring(0, value.user!.email!.indexOf('@'));
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          
          'email': FirebaseAuth.instance.currentUser!.email!,
          'Username': FirebaseAuth.instance.currentUser!.displayName,
          'photoUrl':FirebaseAuth.instance.currentUser!.photoURL,
          'id': FirebaseAuth.instance.currentUser!.uid,
        });
      //  await   storage.setItem('useruid',FirebaseAuth.instance.currentUser!.uid );

      //  var uid = await storage.getItem("useruid");
      //  print("uid"+uid.toString());   
      });
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  
}
    Widget text(String textlogin) {
      return Padding(
        padding: const EdgeInsets.only(left: 68, right: 150),
        child: Text(
          textlogin,
          style: const TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Color(0xFFC4C4C4),
          ),
        ),
      );
    }

    Widget container(Icon icon, TextEditingController cont) {
      return Container(
        width: 660.w,
        height: 27.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(119.5),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF00ACEE),
              Color(0xFF1DBF73),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 1, bottom: 2),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(119.5),
            ),
            width: 657.w,
            height: 26.h,
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(bottom: 3.h),
                child: TextFormField(
                  controller: cont,
                  decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: icon,
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                )),
          ),
        ),
      );
    }

    Widget container2(Icon icon, TextEditingController cont) {
      return Container(
        width: 660.w,
        height: 27.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(119.5),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF00ACEE),
              Color(0xFF1DBF73),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 1, bottom: 2),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(119.5),
            ),
            width: 657.w,
            height: 26.h,
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(bottom: 3.h),
                child: TextFormField(
                  controller: cont,
                  obscureText: pass1 == true ? true : false,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            pass1 = !pass1;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: icon,
                        ),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                )),
          ),
        ),
      );
    }

    Widget container3(Icon icon, TextEditingController cont) {
      return Container(
        width: 660.w,
        height: 27.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(119.5),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF00ACEE),
              Color(0xFF1DBF73),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 1, bottom: 2),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(119.5),
            ),
            width: 657.w,
            height: 26.h,
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(bottom: 3.h),
                child: TextFormField(
                  controller: cont,
                  obscureText: pass2 == true ? true : false,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            pass2 = !pass2;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: icon,
                        ),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                )),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                    'assets/HD-wallpaper-settings-clock-gear-mechanic.jpg'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8),
                  BlendMode.hardLight,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Image.asset(
                    "assets/apbar.png",
                    height: height * 0.12,
                    width: width * 0.8,
                  ),
                  Text(
                    "SIGN UP",
                    style: const TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w400,
                      fontSize: 48,
                      color: Color(0xFF444444),
                    ),
                  ),
                  const Text(
                    "Please enter Phone Number and password",
                    style: TextStyle(
                      fontFamily: "Advent Pro",
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 20.w,
                    ),
                    child: text(
                      "Email",
                    ),
                  ),
                  container(
                      const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      email),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 140.w,
                    ),
                    child: text("User Name "),
                  ),
                  container(
                      const Icon(
                        Icons.person_off,
                        color: Colors.white,
                      ),
                      name),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 140.w,
                    ),
                    child: text("Password"),
                  ),

                  container2(
                      const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black38,
                      ),
                      password),
                  SizedBox(
                    height: height * 0.01,
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      right: 10.w,
                    ),
                    child: text("Confirm Password"),
                  ),
                  container3(
                      const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black38,
                      ),
                      confirmpassword),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      left: 480.w,
                      right: 20.w,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Forgot Password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFFC4C4C4)),
                        ),
                        const Icon(
                          Icons.lock,
                          color: Colors.black38,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 82),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_box,
                          color: Colors.black,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            "Keep login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Advent Pro",
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xFFC4C4C4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CustomButton(
                    onPressed: () {
                      signUpUser();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => LoginLoading(),
                      //   ),
                      // );
                    },
                    title: "Create Account",
                    colorbutton: Colors.black,
                  ),
                  SizedBox(
                    height: height * 0.018,
                  ),
                  const Text(
                    " or log in with ",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "Advent Pro",
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //  signInWithFacebook();
                        },
                        child: Image.asset(
                          "assets/fb_icon.png",
                          height: height * 0.06,
                          width: width * 0.1,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoogleSignup();
                        },
                        child: Container(
                            width: width * 0.1,
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image.asset(
                                "assets/google_icon.png",
                                height: height * 0.05,
                                width: width * 0.1,
                              ),
                            )),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            "assets/tweeter_icon.png",
                            height: height * 0.06,
                            width: width * 0.11,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: height * 0.018,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Advent Pro",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFFAAAAAA),
                        ),
                      ),
                      const Text(
                        " Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Advent Pro",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF1DBF73),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Container(
                    height: height * 0.002,
                    width: width * 0.3,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
