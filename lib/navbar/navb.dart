// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:diagnose/pages/account.dart';
import 'package:diagnose/pages/categories.dart';
import 'package:diagnose/pages/dashboard.dart';
import 'package:diagnose/pages/setting.dart';
import 'package:diagnose/pages/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  var pages = [
    DashBoard(),
    Home(),
    WishList(),
    Account(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MoltenBottomNavigationBar(
        borderRaduis: BorderRadius.circular(0),
        domeWidth: 80, domeHeight: 14,
        barHeight: MediaQuery.of(context).size.height * 0.08,
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
            icon: Icon(Icons.home),
            selectedColor: Color.fromRGBO(29, 191, 115, 1),
            unselectedColor: Colors.black,
          ),
          MoltenTab(
              icon: Center(
                child: FaIcon(
                  FontAwesomeIcons.stethoscope,
                  size: 20,
                ),
              ),
              selectedColor: Color.fromRGBO(29, 191, 115, 1),
              unselectedColor: Colors.black),
          MoltenTab(
              icon: Icon(Icons.favorite),
              selectedColor: Color.fromRGBO(29, 191, 115, 1),
              unselectedColor: Colors.black),
          MoltenTab(
              icon: Icon(Icons.account_circle),
              selectedColor: Color.fromRGBO(29, 191, 115, 1),
              unselectedColor: Colors.black),
          MoltenTab(
              icon: Icon(Icons.settings),
              selectedColor: Color.fromRGBO(29, 191, 115, 1),
              unselectedColor: Colors.black),
        ],
      ),
      body: pages[_selectedIndex],
    );
  }
}
