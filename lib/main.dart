import 'package:diagnose/extra/textfield.dart';
import 'package:diagnose/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

import 'appointments_screens/Book_appionment.dart';
import 'appointments_screens/Cancel_Appoinmetn.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
   final  Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    // return ScreenUtilInit(
    //     designSize: const Size(896, 414),
    //     builder: (context, widget) {
    //       return MaterialApp(
    //         debugShowCheckedModeBanner: false,
    //         home: Splash()
    //         // Splash(),
    //         // routes: {
    //         //   "/BookAppoinment": (context) => BookAppoinment(),
    //         //   "/CancelAppoinment": (context) => CancelAppoinment(),
    //         // },
    //       );
    //     });
     return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
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

        // Otherwise, show something whilst waiting for initialization to complete
        return Container();
      },
    );
  }
}
