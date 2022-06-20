import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onPressed,
    required this.title,
    required this.colorbutton,
  });
  final void Function() onPressed;
  final String title;
  final Color colorbutton;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width * 0.6,
        height: height * 0.06,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF1DBF73), width: width * 0.004),
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white.withOpacity(0.4),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Roboto",
              color: colorbutton,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
