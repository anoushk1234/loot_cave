import 'package:flutter/material.dart';
import 'package:lootcave/screens/drawer.dart';
import 'package:lootcave/screens/homescreen.dart';
//import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DrawerScreen(),
          HomeScreen(),
         //SlidingU
        ],
      )
    );
  }
}
