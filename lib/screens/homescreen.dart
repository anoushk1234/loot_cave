import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scaleFactor = 1.0;
  bool isDrawerOpen = false;
  BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular((30)), topRight: Radius.circular(30));
  int _value = 0;
  int _value1 = 0;
  List<int> inputs = new List();
  String cavegold = '';
  int numberofcaves = 1;
  int limit = 0;
  int lootsum = 0;
  int lootsum1 = 0;
  int lootsum2 = 0;
  List outputs = [];
  List outputs1 = [];
  List outputs2 = [];
  List indexlist = [ ];
  List indexlist1 = [ ];
  List indexlist2 = [ ];
  /*Widget CaveGold() {
    String cavegold = "";
    for (int index = 0; index < 10; index++) {
      int current
      cavegold += inputs[index];
    }
    return Text('$cavegold');
  }*/
  /*Widget panelStack() {
    return
  }*/

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: isDrawerOpen
            ? BorderRadius.only(topLeft: Radius.circular(20.0))
            : BorderRadius.circular(0),
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
              Widget>[
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                isDrawerOpen
                    ? IconButton(
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
                      )
                    : IconButton(
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
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView.builder(
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: numberofcaves,
                    itemBuilder: (context, index) {
                      int temp = inputs[index];
                      return (indexlist.contains(index))
                          ? Container(
                              margin: EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width * 0.93,
                              decoration: BoxDecoration(
                                //border: Border.all(color: Colors.blueAccent),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 5,
                                      blurRadius: 6,
                                      color: Colors.black12)
                                ],
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          '$index',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 35),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(8),
                                    height: 280.0,
                                    width: 280.0,
                                    decoration: BoxDecoration(
                                      // border: Border.all(color: Colors.red),
                                      image: DecorationImage(
                                        image: AssetImage('assets/img4.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                  //Text("Some random stuff about the cave."),
                                  Text(
                                    'Gold in cave $temp',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 40),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.all(15),
                              width: MediaQuery.of(context).size.width * 0.93,
                              decoration: BoxDecoration(
                                //border: Border.all(color: Colors.blueAccent),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 5,
                                      blurRadius: 6,
                                      color: Colors.black12)
                                ],
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 15),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          '$index',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 35),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(8),
                                    height: 280.0,
                                    width: 280.0,
                                    decoration: BoxDecoration(
                                      // border: Border.all(color: Colors.red),
                                      image: DecorationImage(
                                        image: AssetImage('assets/img5.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.rectangle,
                                    ),
                                  ),
                                 // Text("Some random stuff about the cave.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                                ],
                              ),
                            );
                    })),
            Container(
              height: 90,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.blueAccent),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 5, blurRadius: 6, color: Colors.black12)
                ],
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                '$lootsum',
                style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 40),
              ),
                      Text(
                        '$indexlist',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 40),
                      ),
                    ],
                  )),
            )
          ]),
          SlidingUpPanel(
            backdropEnabled: true,
            panel: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(41, 128, 185, 0.98),
                  Color.fromRGBO(109, 213, 250, 0.98),
                  Colors.white
                ], begin: Alignment.topRight, end: Alignment.bottomLeft),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 75.0,
                  ),
                  Text(
                    "Number of Caves",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.red[700],
                            inactiveTrackColor: Colors.red[100],
                            trackShape: RoundedRectSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            thumbColor: Colors.redAccent,
                            overlayColor: Colors.red.withAlpha(32),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 28.0),
                            tickMarkShape: RoundSliderTickMarkShape(),
                            activeTickMarkColor: Colors.red[700],
                            inactiveTickMarkColor: Colors.red[100],
                            valueIndicatorShape:
                                PaddleSliderValueIndicatorShape(),
                            valueIndicatorColor: Colors.redAccent,
                            valueIndicatorTextStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: Colors.red[700],
                                  inactiveTrackColor: Colors.red[100],
                                  trackShape: RoundedRectSliderTrackShape(),
                                  trackHeight: 4.0,
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 12.0),
                                  thumbColor: Colors.redAccent,
                                  overlayColor: Colors.red.withAlpha(32),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 28.0),
                                  tickMarkShape: RoundSliderTickMarkShape(),
                                  activeTickMarkColor: Colors.red[700],
                                  inactiveTickMarkColor: Colors.red[100],
                                  valueIndicatorShape:
                                      PaddleSliderValueIndicatorShape(),
                                  valueIndicatorColor: Colors.redAccent,
                                  valueIndicatorTextStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                child: Slider(
                                  min: 0,
                                  max: 10,
                                  value: _value1.toDouble(),
                                  onChanged: (value) {
                                    setState(() {
                                      _value1 = value.round();
                                    });
                                  },
                                  label: '$_value1',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text("$numberofcaves",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  ButtonTheme(
                    height: 55,
                    minWidth: 165,
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.transparent)),
                      onPressed: () {
                        setState(() {
                          //inputs.add(_value1);
                          numberofcaves = _value1;
                        });
                      },
                      child: Text(
                        "OK",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Gold in each Cave",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.red[700],
                            inactiveTrackColor: Colors.red[100],
                            trackShape: RoundedRectSliderTrackShape(),
                            trackHeight: 4.0,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12.0),
                            thumbColor: Colors.redAccent,
                            overlayColor: Colors.red.withAlpha(32),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 28.0),
                            tickMarkShape: RoundSliderTickMarkShape(),
                            activeTickMarkColor: Colors.red[700],
                            inactiveTickMarkColor: Colors.red[100],
                            valueIndicatorShape:
                                PaddleSliderValueIndicatorShape(),
                            valueIndicatorColor: Colors.redAccent,
                            valueIndicatorTextStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          child: Slider(
                            min: 0,
                            max: 100,
                            value: _value.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                _value = value.round();
                              });
                            },
                            label: '$_value',
                          ),
                        ),
                      ),
                      Text(
                        cavegold,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ButtonTheme(
                          height: 35,
                          minWidth: 90,
                          child: RaisedButton(
                            color: Colors.white,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.transparent)),
                            onPressed: () {
                              if (limit < numberofcaves) {
                                setState(() {
                                  inputs.add(_value);
                                  cavegold += '$_value, ';
                                  limit++;
                                });
                              } else {
                                setState(() {
                                  inputs.clear();
                                  cavegold = "";
                                  limit = 0;
                                });
                              }
                            },
                            child: Text(
                              "Enter",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonTheme(
                    height: 55,
                    minWidth: 165,
                    child: RaisedButton(
                      color: Colors.white,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.transparent)),
                      onPressed: () {
                        setState(() {
                          lootsum = 0;
                          lootsum1 = 0;
                          lootsum2 = 0;
                          for (int i = 0; i < inputs.length; i++){
                            lootsum1 += inputs[i];
                            outputs1.add(inputs[i]);
                            indexlist1.add(i);
                            if(i+4 < inputs.length){
                              if((inputs[i+4]+inputs[i+2]) >= inputs[i+3]){
                                i+= 1;
                              }
                              else if((inputs[i+4]+inputs[i+2]) < inputs[i+3]){
                                i+= 2;
                              }
                            }
                            else if(i+3 < inputs.length){
                              if(inputs[i+2] >= inputs[i+3]){
                                i+= 1;
                              }
                              else if(inputs[i+2] < inputs[i+3]){
                                i+= 2;
                              }
                            }
                            else if(i+2 < inputs.length){
                              i+= 1;
                            }
                            else{
                              break;
                            }
                          }
                          for (int i = 1; i < inputs.length; i++){
                            lootsum2 += inputs[i];
                            outputs2.add(inputs[i]);
                            indexlist2.add(i);
                            if(i+4 < inputs.length){
                              if((inputs[i+4]+inputs[i+2]) >= inputs[i+3]){
                                i+= 1;
                              }
                              else if((inputs[i+4]+inputs[i+2]) < inputs[i+3]){
                                i+= 2;
                              }
                            }
                            else if(i+3 < inputs.length){
                              if(inputs[i+2] >= inputs[i+3]){
                                i+= 1;
                              }
                              else if(inputs[i+2] < inputs[i+3]){
                                i+= 2;
                              }
                            }
                            else if(i+2 < inputs.length){
                              i+= 1;
                            }
                            else{
                              break;
                            }
                          }
                          lootsum = (lootsum1>lootsum2)?lootsum1:lootsum2;
                          outputs = (lootsum1>lootsum2)?outputs1:outputs2;
                          indexlist = (lootsum1>lootsum2)?indexlist1:indexlist2;
                          print(lootsum);
                          print (outputs);
                          print(indexlist);
                        });
                      },
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            borderRadius: radius,
            collapsed: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  FontAwesomeIcons.chevronCircleUp,
                ),
              ),
            ),
            margin: const EdgeInsets.only(left: 10, right: 10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 4,
                blurRadius: 4,
              )
            ],
          )
        ],
      ),
    );
  }
}
