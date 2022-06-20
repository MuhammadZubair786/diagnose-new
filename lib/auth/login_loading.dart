import 'dart:async';

import 'package:diagnose/appointments_screens/select_devoce_At.dart';
import 'package:diagnose/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class LoginLoading extends StatefulWidget {
  const LoginLoading({Key? key}) : super(key: key);

  @override
  State<LoginLoading> createState() => _LoginLoadingState();
}

class _LoginLoadingState extends State<LoginLoading> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SelectDeviceAT(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget text(String textlogin) {
      return Padding(
        padding: const EdgeInsets.only(left: 68, right: 150),
        child: Text(
          textlogin,
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: const Color(0xFFC4C4C4),
          ),
        ),
      );
    }

    Widget container(Icon icon) {
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
                decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: icon,
                    ),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.15,
                ),
                Image.asset(
                  "assets/apbar.png",
                  height: height * 0.12,
                  width: width * 0.8,
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w400,
                    fontSize: 48,
                    color: const Color(0xFF444444),
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
                  height: height * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 20.w,
                  ),
                  child: text("User Name / Email"),
                ),
                container(Icon(
                  Icons.person,
                  color: Colors.white,
                )),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 140.w,
                  ),
                  child: text("Password"),
                ),
                container(
                  Icon(
                    Icons.remove_red_eye,
                    color: Colors.black38,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 480.w,
                    right: 20.w,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Forgot Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color(0xFFC4C4C4)),
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
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 82),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_box,
                        color: Color(0xFF1DBF73),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Keep login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Advent Pro",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: const Color(0xFFC4C4C4),
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
                  onPressed: () {},
                  title: "Enter",
                  colorbutton: Colors.black,
                ),
                SizedBox(
                  height: height * 0.018,
                ),
                Text(
                  " or log in with ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                      onTap: () {},
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
                      onTap: () {},
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
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(
                          "assets/tweeter_icon.png",
                          height: height * 0.06,
                          width: width * 0.11,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.018,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Advent Pro",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xFFAAAAAA),
                      ),
                    ),
                    Text(
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
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              Image.asset(
                "assets/Gif/loading.gif",
                height: height * 0.1,
                width: width * 0.6,
              ),
              Text(
                "Just wait",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Roboto", fontSize: 12, letterSpacing: 0.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
