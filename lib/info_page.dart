import 'package:eneatipos_test/eneagram_screen.dart';
import 'package:flutter/material.dart';

final EneagramScreen infoScreen = new EneagramScreen(
    title: "Información",
    builder: (BuildContext context) {
      return InfoPage();
    });

class InfoPage extends StatefulWidget {
  @override
  InfoPageState createState() {
    return new InfoPageState();
  }
}

class InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 40.0, bottom: 10.0, right: 10.0, left: 10.0),
        child: ListView(
          children: <Widget>[
            new Text('Información general Eneagrama', style: TextStyle(color: Colors.black),),
            new Divider(color: Colors.black,),
            new Text("Test",style: TextStyle(color: Colors.black),)
          ],
        ),
      ),
    );
  }
}
