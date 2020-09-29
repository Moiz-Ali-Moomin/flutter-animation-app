import 'dart:async';
import 'package:flutter/material.dart';
import './HomeScreen.dart';

void main() {
  runApp(MyTechApp());
}

class MyTechApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 3),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secAnimation,
                Widget child) {
              animation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInCirc,
              );
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secAnimation) {
              return MyApp();
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[200],
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.indigo[300],
                borderRadius: BorderRadius.all(Radius.circular(1))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(20),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: NetworkImage("https://flutter.dev/images/catalog-widget-placeholder.png"),
                          fit: BoxFit.fill
                          ),
                        ),
                      ),
                      // CircleAvatar(
                      //   radius: 100.0,
                      //   child: Image.asset("./assets/flutter.png"),
                      // ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Text(
                          "Flutter Animation App",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    color: Colors.white70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Text(
                            "Loading App",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(
                              backgroundColor: Colors.indigoAccent,
                              strokeWidth: 6,
                            ),
                          ],
                        )
                      ],
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
