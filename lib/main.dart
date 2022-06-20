import 'package:diagnose/extra/textfield.dart';
import 'package:diagnose/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'appointments_screens/Book_appionment.dart';
import 'appointments_screens/Cancel_Appoinmetn.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(896, 414),
        builder: (context, widget) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Splash()
            // Splash(),
            // routes: {
            //   "/BookAppoinment": (context) => BookAppoinment(),
            //   "/CancelAppoinment": (context) => CancelAppoinment(),
            // },
          );
        });
  }
}
