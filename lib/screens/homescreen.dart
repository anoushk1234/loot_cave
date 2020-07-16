import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scaleFactor = 1.0;
  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: isDrawerOpen? BorderRadius.only(topLeft: Radius.circular(20.0)) : BorderRadius.circular(0),
        color: Colors.white,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children :<Widget>[
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                isDrawerOpen? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      xOffset = 0;
                      yOffset = 0;
                      scaleFactor = 1;
                      isDrawerOpen = false;
                    });
                  },
                ):IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      xOffset = 160;
                      yOffset = 115;
                      scaleFactor = 0.85;
                      isDrawerOpen = true;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10.0,),


          ]
      ),
    );
  }
}
