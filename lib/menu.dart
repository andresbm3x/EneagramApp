import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget ItemMenu(String text) {
      final TextStyle tStyle = new TextStyle(
        color: Colors.white,
        fontSize: 22.0,
      );

      return new Container(
        child: new Text(
          text,
          style: tStyle,
        ),
        padding: new EdgeInsets.all(12.0),
      );
    }

    return new Container(

        child: new Center(
      child: new Column(
        children: <Widget>[
          new Image.network(
            "http://www.madanesschool.com/resources/ENEAGRAMA%20SYMBOL%20HQ%20transparencia%20full%20de%20logo%20frnando.png?timestamp=1393223535485",
            height: 250.0,
          ),
          ItemMenu("Información"),
          ItemMenu("Resultado"),
          ItemMenu("Histórico"),
        ],
      ),
    ));
  }
}
