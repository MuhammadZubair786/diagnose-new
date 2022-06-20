import 'package:diagnose/pages/full_test_screens/sound_testft/headphone_st.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:headset_connection_event/headset_event.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class SpeakerST extends StatefulWidget {
  const SpeakerST({Key? key}) : super(key: key);
  @override
  State<SpeakerST> createState() => _SpeakerSTState();
}

class _SpeakerSTState extends State<SpeakerST> {
  var data;

   FlutterTts flutterTts = FlutterTts();

   

  final _headsetPlugin = HeadsetEvent();
  late HeadsetState _headsetState;

   late TextEditingController controller1;

   var set1 = 0;

  var okButton=false;

  void initState() {
    super.initState();

    controller1 = TextEditingController();

    final showButton = controller1.text.isNotEmpty;

    controller1.addListener(() {
      print(data.toString().length);
      print(data.toString());
      if (controller1.text.length == 4 && controller1.text == "3478") {
        setState(() {
          this.okButton = true;
          print(okButton);
        });
      } else {
        setState(() {
          this.okButton = false;
          print(okButton);
        });
      }
    });

    // controller1.addListener(() {
    //   // final showButton = controller1.text;

    //   if (controller1.text.length == 4 && controller1.text == "5621") {
    //     setState(() => this.okButton = true);
    //   } else {
    //     setState(() => this.okButton = false);
    //   }
    // });

    // _headsetPlugin.getCurrentState.then((_val) {
    //   setState(() {
    //     _headsetState = _val!;

    //     if (_headsetState == HeadsetState.DISCONNECT) {
    //       callfunction2();
    //     }
    //   });
    // });

    // _headsetPlugin.setListener((_val) {
    //   setState(() {
    //     _headsetState = _val;
    //     set1 = 1;
    //     if (_headsetState == HeadsetState.DISCONNECT) {
    //       callfunction2();
    //     }
    //   });
    // });
  }

  // void callfunction2() async {
  //   if (set1 == 1) {
  //     // Future.delayed(Duration(seconds: 5), () {
  //     //   Navigator.pushReplacement(
  //     //     context,
  //     //     MaterialPageRoute(
  //     //       builder: (context) => OhNo1headphone(),
  //     //     ),
  //     //   );
  //     // });
  //   } else {}
  // }

  void  checkheadphone(){
     _headsetPlugin.getCurrentState.then((_val) {
      setState(() {
        _headsetState = _val!;

        if (_headsetState == HeadsetState.DISCONNECT) {
         print("head phone discconected");
        }
          if(_headsetState==HeadsetState.CONNECT){
            Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        reverseDuration: const Duration(seconds: 1),
                        duration: const Duration(seconds: 1),
                        child: const HEadphone1ST(),
                      ),
                    );
        }
      });
    });

    _headsetPlugin.setListener((_val) {
      setState(() {
        _headsetState = _val;
        set1 = 1;
        if (_headsetState == HeadsetState.DISCONNECT) {
        print("head phone discconected");
        }
        if(_headsetState==HeadsetState.CONNECT){
            Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        reverseDuration: const Duration(seconds: 1),
                        duration: const Duration(seconds: 1),
                        child: const HEadphone1ST(),
                      ),
                    );
        }
      });
    });

  }

  speak() async {
    await flutterTts.speak("3\n\n4\n\n7\n\n8 ");
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.4);
    print("ok");
  }
   
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Figma Flutter Generator Diagose1Widget - FRAME
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(29, 191, 115, 1),
                Color.fromRGBO(0, 172, 238, 1)
              ]),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.08,
            ),
            Text(
              '2/6',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Roboto',
                fontSize: 12,
                decoration: TextDecoration.none,
                letterSpacing: -0.3333333432674408,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/vector.svg', semanticsLabel: 'vector'),
                SizedBox(
                  width: width * 0.04,
                ),
                Container(
                  width: width * 0.7,
                  child: LinearProgressIndicator(
                    value: 0.2,
                    backgroundColor: Colors.white.withOpacity(0.5),
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              width: width * 0.6,
              height: height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Gif/speaker.gif'),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 5, top: 5),
              child: Text(
                'Speaker',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Roboto',
                    fontSize: 35,
                    decoration: TextDecoration.none,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ),
            Text(
              'Just enter the number what yo listen\nand right in box ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Advent Pro',
                fontSize: 16,
                decoration: TextDecoration.none,
                letterSpacing:
                    0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              child: SingleChildScrollView(
                child: PinCodeTextField(
                  controller: controller1,
                  highlight: true,
                  highlightColor: Colors.black,
                  defaultBorderColor: Colors.black,
                  hasTextBorderColor: Colors.white,
                  highlightPinBoxColor: Colors.white,
                  maxLength: 4,
                  onTextChanged: (text) {
                    setState(() {});
                  },
                  onDone: (text) {},
                  pinBoxWidth: 50,
                  pinBoxHeight: 64,
                  hasUnderline: true,
                  wrapAlignment: WrapAlignment.spaceAround,
                  pinBoxDecoration:
                      ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                  pinTextStyle: TextStyle(fontSize: 22.0),
                  pinTextAnimatedSwitcherTransition:
                      ProvidedPinBoxTextAnimation.scalingTransition,
                  pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                  highlightAnimationBeginColor: Colors.black,
                  highlightAnimationEndColor: Colors.white12,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width * 0.6,
                height: height * 0.07,
                child:
                  okButton ?  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    primary: Colors.white,
                    elevation: 6,
                  ),
                  onPressed: () {
                    checkheadphone();
                    // Navigator.push(
                    //   context,
                    //   PageTransition(
                    //     type: PageTransitionType.rightToLeft,
                    //     reverseDuration: const Duration(seconds: 1),
                    //     duration: const Duration(seconds: 1),
                    //     child: const HEadphone1ST(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "Ok",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'Advent Pro',
                    ),
                  ),
                ):
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    primary: Colors.white,
                    elevation: 6,
                  ),
                  onPressed: () {
                    speak();
                    // Navigator.push(
                    //   context,
                    //   PageTransition(
                    //     type: PageTransitionType.rightToLeft,
                    //     reverseDuration: const Duration(seconds: 1),
                    //     duration: const Duration(seconds: 1),
                    //     child: const HEadphone1ST(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "Play",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'Advent Pro',
                    ),
                  ),
                )
              ),
            ),
            SizedBox(
              height: height * 0.005,
            ),
            GestureDetector(
              // onTap: () {
              //   Navigator.pushReplacement(context,
              //       MaterialPageRoute(builder: (context) => OhnoSettings()));
              // },
              child: Text(
                'Again',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Advent Pro',
                    fontSize: 25,
                    decoration: TextDecoration.none,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
