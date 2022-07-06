

// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:diagnose/navbar/navb.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';


class NaviBar extends StatefulWidget {
  const NaviBar({Key? key}) : super(key: key);

  @override
  State<NaviBar> createState() => _NaviBarState();
}

class _NaviBarState extends State<NaviBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return MoltenBottomNavigationBar(
      borderRaduis: BorderRadius.circular(0),
      domeWidth: 80, domeHeight: 16,
      barHeight: height * 0.08,
      colori: Color.fromRGBO(29, 191, 115, 1),
      selectedIndex: _selectedIndex,
      borderColor: Colors.red,
      domeCircleColor: Colors.white,
      // specrify what will happen when a tab is clicked
      onTabChange: (int clickedIndex) {
        setState(() {
          _selectedIndex = clickedIndex;
        });
      },
      // ansert as many tabs as you like
      tabs: [

        MoltenTab( 
          
          icon: GestureDetector(  
            onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNavbar(),
                            ),
                          );
                        },
            child: Icon(Icons.home)),
          selectedColor: Color.fromRGBO(29, 191, 115, 1),
          unselectedColor: Colors.black,
        ),
      ],
    );
  }
}
