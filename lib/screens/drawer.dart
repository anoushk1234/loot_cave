import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home.dart';
class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          //colors: [Color.fromRGBO(79, 176, 255, 1),Color.fromRGBO(255, 209, 148, 1)],//Color.fromRGBO(142, 45, 226, 1)
          colors: [Color.fromRGBO(41, 128, 185, 0.98),
            Color.fromRGBO(109, 213, 250, 0.98),
            Colors.white],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 100.0),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10,),
                  CircleAvatar(
                    backgroundImage:new AssetImage('assets/img3.jpg')
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Bobby Davis',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 23.0,
                      fontFamily: 'PitataOne'
                    ),
                  ),
                ],
              ),
            ),
            FlatButton.icon(
              onPressed: (){
                //nav
                Navigator.of(context).pushNamed('/git');
              },
              icon: Icon(FontAwesomeIcons.github,color: Colors.white,),
              label: Text(
                "Github",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
