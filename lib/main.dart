import 'package:flutter/material.dart';
import 'package:lootcave/screens/Loading.dart';
import 'package:lootcave/screens/home.dart';
import 'package:lootcave/screens/homescreen.dart';



void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/hs': (context) => HomeScreen()
      },
    ));
