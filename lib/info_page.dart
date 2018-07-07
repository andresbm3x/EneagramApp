import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {

  Widget EneatipoCard(String text,String route){
    return new GestureDetector(
      onTap: () {} ,
      child: new Container(
        height: 150.0,
        margin: new EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          color: Colors.deepPurpleAccent,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(10.0),
          boxShadow: <BoxShadow> [
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0),
            )
          ]
        ),
        child: new Row(
          children: <Widget>[
            new Icon(Icons.account_circle),
            new Text(text),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Column(
        children: <Widget>[
          EneatipoCard("Tipo 1","1"),
          EneatipoCard("Tipo 2","2"),
          EneatipoCard("Tipo 3","3"),
        ],
      ),
    );
  }

  void _onTapCard(String route) {

  }
}
