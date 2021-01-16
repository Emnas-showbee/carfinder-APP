import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


void clickMe() {
  print('Click Button');
}

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25.0),
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.teal[700], Colors.teal[50]],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: height / 2.5,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/carfinder.png"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: height / 30,
            ),
            Text(
              "Find where to park now!",
              style: TextStyle(color: Colors.black, fontSize: height / 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height / 30,
            ),
            Text(
              "Your location is important for me to know where should you park",
              style: TextStyle(color: Colors.black, fontSize: height / 40),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height / 20,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.5)),
                  padding: EdgeInsets.all(height / 40),
                  textColor: Colors.white,
                  color: Colors.teal[600],
                  onPressed: () =>
                      _onAlertWithCustomContentPressedOwner(context),
                  child: new Text(
                    "Find Space",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget FadeAlertAnimation(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  return Align(
    child: FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

_onAlertWithCustomContentPressedRenter(context) {
  Alert(context: context, title: "User", buttons: [
    DialogButton(
      color: Colors.cyanAccent[700],
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RenterSignin()));
      },
      child: Text(
        "Sign in",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
    DialogButton(
      color: Colors.greenAccent[700],
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => RenterSignupScreen()));
      },
      child: Text(
        "Sign up",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  ]).show();
}
