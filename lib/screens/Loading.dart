import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  void _onHorizontalDrag(DragEndDetails details) {
    //if(details.primaryVelocity == 0) return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity.compareTo(0) == -1)
      Navigator.pushNamed(context, '/home');
    else
      Navigator.pushNamed(context, '/home');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 55), vsync: this);
    animation = Tween(begin: 1.0, end: -1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.slowMiddle));
    animationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: <Widget>[
        Positioned(
            child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(41, 128, 185, 0.98),
                Color.fromRGBO(109, 213, 250, 0.98),
                Colors.white
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(1, 2))
              ]),
        )),
        Positioned(
          child: MyAnimation(),
        ),
        Align(
            alignment: Alignment(0,-0.5),
            child: Container(
              child: Text("Loot\nCave",
                style: TextStyle(
                  fontSize: 150,
                    color: Color.fromRGBO(15, 15, 107, 1),
                    fontFamily: 'PirataOne'
                ),
              ),
            ),
          ),

        Positioned(
          bottom: 130,
          child: AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform:
                      Matrix4.translationValues(animation.value * width, 0, 0),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(('assets/img2.png')),
                  ),
                );
              }),
        ),
        Positioned(
          bottom: 5,
          left: 0.09*MediaQuery.of(context).size.width,
          child: GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details) => _onHorizontalDrag(details),
            child: Container(
              width: 320,
              padding: EdgeInsets.all(35),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.navigate_next,color: Colors.white,size: 60,),
                      Icon(Icons.navigate_next,color: Colors.white,size: 60,),
                      Icon(Icons.navigate_next,color: Colors.white,size: 60,),
                      Icon(Icons.navigate_next,color: Colors.white,size: 60,)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text("Swipe to get started",
                      style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 3,
                          color: Colors.white,
                          fontFamily: 'PirataOne'
                      ),
                    ),],
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class MyClipPath extends AnimatedWidget {
  final Animation<double> animation;

  MyClipPath(this.animation) : super(listenable: animation);

  final Color backgroundColor = Color.fromRGBO(48, 51, 107, 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(children: [
            Positioned(
              bottom: 0,
              right: animation.value,
              child: ClipPath(
                clipper: BottomWaveClipper(),
                child: Opacity(
                  opacity: 0.7,
                  child: Container(
                    color: backgroundColor,
                    width: 1000,
                    height: 200,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: animation.value,
              child: ClipPath(
                clipper: BottomWaveClipper(),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    color: backgroundColor,
                    width: 1000,
                    height: 200,
                  ),
                ),
              ),
            ),

          ]),
        ),
      ],
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, 40.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 40.0);

    for (int i = 0; i < 10; i++) {
      if (i % 2 == 0) {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            0.0,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      } else {
        path.quadraticBezierTo(
            size.width - (size.width / 16) - (i * size.width / 8),
            size.height - 120,
            size.width - ((i + 1) * size.width / 8),
            size.height - 160);
      }
    }

    path.lineTo(0.0, 40.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..repeat();

    animation = Tween<double>(begin: -500, end: 0).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyClipPath(animation);
  }
}
