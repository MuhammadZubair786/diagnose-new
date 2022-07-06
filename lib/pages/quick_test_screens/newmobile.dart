import 'package:flutter/material.dart';

class NewMobile extends StatefulWidget {
  const NewMobile({ Key? key }) : super(key: key);

  @override
  State<NewMobile> createState() => _NewMobileState();
}

class _NewMobileState extends State<NewMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){},
           child: Text("B1"))
        ],
      ),
      
    );
  }
}