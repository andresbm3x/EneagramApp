import 'package:eneatipos_test/eneagram_screen.dart';
import 'package:flutter/material.dart';

final EneagramScreen infoScreen = new EneagramScreen(
    title: "Información",
    builder: (BuildContext context) {
      return InfoPage();
    });

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child: new Text('información general Eneagrama', style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
