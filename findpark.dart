import 'package:flutter/material.dart';
import 'vehicle.dart';


final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
Contact newContact = new Contact();

void main() => runApp(MyApp());

void _parkForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
        showMessage('Unavailable. Please try again');
    }else{
        form.save();
        print('Location to Park is available!'); 
        print('Located at: ${newContact.location}');  
    }
}

void showMessage(String messsage, [MaterialColor color = Colors.blue]){
    _scaffoldKey.currentState
                .showSnackBar(new SnackBar(backgroundColor: color, content: Text (messsage)));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Parking Space Finder App',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.white,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(title: 'Parking Space Finder App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title})  : super(key: key);
  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
    Contact newContact = new Contact();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            body: SafeArea(
                top: false ,
                bottom: false,
                child: Form(
                    key: _formKey,
                    autovalidate: true ,
                    child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        children: [
                            TextFormField(
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.person_pin),
                                    hintText: 'Enter your name',
                                    labelText: 'Username',
                                ),
                            ),
                            TextFormField(
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.add_location_alt),
                                    hintText: 'Where are you?',
                                    labelText: 'Location',
                                ),
                            ),
                            TextFormField(
                                decoration: const InputDecoration(
                                    icon: const Icon(Icons.drive_eta),
                                    hintText: 'Optional',
                                    labelText: 'No. of Vehicle',
                                ),
                                keyboardType: TextInputType.number,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 40, top: 20),
                                child: RaisedButton(
                                    child: Text('Click to find Parking Space'),
                                    onPressed: _parkForm,
                                )

                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
