import 'package:eneatipos_test/backdrop.dart';
import 'package:eneatipos_test/info_eneagram_page.dart';
import 'package:eneatipos_test/info_page.dart';
import 'package:eneatipos_test/menu.dart';
import 'package:flutter/material.dart';

class EneagramApp extends StatefulWidget {
  @override
  _EneagramAppState createState() => _EneagramAppState();
}

class _EneagramAppState extends State<EneagramApp> {
  var activeScreen = infoScreen;
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EneagramApp',
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
        title: "Eneagrama",
        backPage: MenuPage(
          onMenuItemSelected: (String itemId) {
            if (activeScreen.title!=itemId)
            switch (itemId){
                case "info":
                  setState(() => activeScreen=infoScreen);
                  break;
                case "test":
                  setState(() => activeScreen=infoScreen);
                break;
                case "infoEne":
                  setState(() => activeScreen=infoEneagramas);
                break;
                case "config":
                  setState(() => activeScreen=infoScreen);
                break;
              }
          },
        ),
        frontPage: activeScreen,
      ),
    );
  }
}
