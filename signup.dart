import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class OwnerSignupScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<OwnerSignupScreen> {
  TextEditingController lastname = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController contactnumber = TextEditingController();
  TextEditingController location = TextEditingController();

  Future register() async {
    var url = "http://192.168.254.121:8080/apiroomers/owner_register.php";
    var response = await http.post(url, body: {
      "lastname": lastname.text,
      "firstname": firstname.text,
      "email": email.text,
      "password": password.text,
      "contactnumber": contactnumber.text,
      "location": location.text,
    });
    var data = json.decode(response.body);
    if (data == "error") {
      Fluttertoast.showToast(
          msg: "This user already exist",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Registered",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OwnerSignin()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(children: <Widget>[
        new Container(
          decoration: new BoxDecoration(color: Colors.teal),
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 10),
                AppBar(
                  toolbarHeight: 30,
                  elevation: 00.0,
                  title: Text(
                    'Registration ',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: 40),
                Card(
                  color: Colors.tealAccent[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: lastname,
                              decoration: InputDecoration(
                                labelText: "Enter your Lastname",
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Your your Lastname',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: firstname,
                              decoration: InputDecoration(
                                labelText: "Enter your Firstname",
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Your your Firstname',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: email,
                              decoration: InputDecoration(
                                labelText: "Enter your Email",
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'lopez.joe@google.com',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              obscureText: true,
                              controller: password,
                              decoration: InputDecoration(
                                labelText: "Enter your Password",
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Your Password',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextField(
                              controller: contactnumber,
                              decoration: InputDecoration(
                                labelText: "Enter Number",
                                fillColor: Colors.white,
                                filled: true,
                                hintText: '+639*********',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextField(
                              controller: location,
                              decoration: InputDecoration(
                                labelText: "Enter location",
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Your location',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                              width: double.infinity,
                              child: RaisedButton(
                                textColor: Colors.teal,
                                color: Colors.white,
                                child: Text(
                                  'Submit',
                                  style: new TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                onPressed: () {
                                  register();
                                },
                              )),
                          Container(
                              child: Row(
                            children: <Widget>[
                              Text('Already have an account?'),
                              FlatButton(
                                textColor: Colors.white,
                                child: Text(
                                  'Sign In',
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OwnerSignin()));
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ))
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
