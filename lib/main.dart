import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:lootcave/screens/Loading.dart';
import 'package:lootcave/screens/githublink.dart';
import 'package:lootcave/screens/home.dart';
import 'package:lootcave/screens/homescreen.dart';



void main() => runApp(Phoenix(
  child:   MaterialApp(
  
        debugShowCheckedModeBanner: false,
  
        routes: {
  
          '/': (context) => Loading(),
  
          '/home': (context) => Home(),
  
          '/hs': (context) => HomeScreen(),
  
          '/git':(context)=> GitHubLink()
  
        },
  
      ),
));
