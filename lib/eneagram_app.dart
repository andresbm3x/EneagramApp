import 'package:eneatipos_test/backdrop.dart';
import 'package:eneatipos_test/menu.dart';
import 'package:flutter/material.dart';

class EneagramApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eneagrama',
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          title: new TextStyle(color: Colors.white, fontSize: 26.0),
          body1: new TextStyle(color: Colors.white, fontSize: 16.0),
          subhead: new TextStyle(color: Colors.white, fontSize: 22.0),
        ),
      ),
      home: BackDrop(
        backPage: Center(
          child: MenuPage(),
        ),
      ),
    );
  }
}

