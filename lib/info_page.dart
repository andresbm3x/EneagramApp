import 'package:eneatipos_test/detail_page.dart';
import 'package:flutter/material.dart';

class Eneatipo {
  static const defaultIcon = Icon(Icons.android);

  int id;
  String title;
  String description;
  Color color;
  Icon icon;

  Eneatipo(this.id, this.title, this.description, this.color,
      [this.icon = defaultIcon]);
}

class InfoPage extends StatelessWidget {

  Widget eneatipoCard(Eneatipo tipo,BuildContext context) {
    return new GestureDetector(
      onTap: () => onTapCard(tipo,context),
      child: new Container(
        height: 180.0,
        margin: new EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
            color: tipo.color,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(19.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.black54,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0),
              )
            ]),
        child: Padding(
          padding: new EdgeInsets.all(18.0),
          child: new Row(children: <Widget>[
            new Container(height: 100.0, child: new Icon(Icons.account_circle)),
            Container(
              child: Column(
                children: <Widget>[
                  Text(tipo.title),
                  Text(tipo.description),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void onTapCard(Eneatipo eneatipo,BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(eneatipo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0,25.0, 0.0, 0.0),
        child: new ListView(
          children: <Widget>[
            eneatipoCard(Eneatipo(1, "Eneatipo 1", "Eneatipo 1",
                new Color.fromARGB(255, 150, 28, 130)),context),
            eneatipoCard(Eneatipo(1, "Eneatipo 2", "Eneatipo 2",
                new Color.fromARGB(255, 40, 35, 89)),context),
            eneatipoCard(Eneatipo(1, "Eneatipo 3", "Eneatipo 3",
                new Color.fromARGB(255, 19, 113, 185)),context),
            eneatipoCard(Eneatipo(1, "Eneatipo 4", "Eneatipo 4",
                new Color.fromARGB(255, 9, 142, 52)),context),
            eneatipoCard(Eneatipo(1, "Eneatipo 5", "Eneatipo 5",
                new Color.fromARGB(255, 249, 178, 52)),context),
            eneatipoCard(Eneatipo(1, "Eneatipo 6", "Eneatipo 6",
                new Color.fromARGB(255, 234, 78, 27)),context),
            eneatipoCard(Eneatipo(1, "Eneatipo 7", "Eneatipo 7",
                new Color.fromARGB(255, 231, 50, 43)),context),
            eneatipoCard(Eneatipo(1, "Eneatipo 8", "Eneatipo 8",
                new Color.fromARGB(255, 190, 22, 35)),context),
            eneatipoCard(Eneatipo(1, "Eneatipo 9", "Eneatipo 9",
                new Color.fromARGB(255, 161, 25, 91)),context),
          ],
        ),
      ),
    );
  }
}
