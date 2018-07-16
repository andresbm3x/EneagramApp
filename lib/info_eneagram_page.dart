import 'package:eneatipos_test/detail_page.dart';
import 'package:eneatipos_test/eneagram_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Eneatipo {
  static const defaultIcon = Icons.android;

  int id;
  String title;
  String description;
  Color color;
  IconData icon;

  Eneatipo(this.id, this.title, this.description, this.color,
      [this.icon = defaultIcon]);
}

final EneagramScreen infoEneagramas = new EneagramScreen(
  title: "Información",
  builder: (BuildContext context) {
    return InfoEneagramas();
  },
);

class EneatipoCard extends StatelessWidget {

  final Eneatipo eneatipo;


  void onTapCard(Eneatipo eneatipo, BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute<Null>(builder: (context) => DetailPage(eneatipo)));
  }

  EneatipoCard(this.eneatipo);



  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => onTapCard(eneatipo, context),
      child: new Container(
        //height: 120.0,
        margin: new EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
            color: eneatipo.color,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(19.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.black54,
                blurRadius: 3.0,
                offset: new Offset(0.0, 5.0),
              )
            ]),
        child: new Row(children: <Widget>[
          Hero(
            tag: eneatipo.title,
            child: new Container(
              //color: Colors.red,
              height: 60.0,
              width: 60.0,
              child: new Icon(
                eneatipo.icon,
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  eneatipo.title,
                  style: Theme
                      .of(context)
                      .textTheme
                      .subhead,
                ),
                Text(eneatipo.description),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}


class InfoEneagramas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
        child: new StreamBuilder(
            stream: Firestore.instance.collection('eneatipos').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Text(
                  "Cargando..", style: new TextStyle(color: Colors.black));
              return new ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.documents[index];
                    return new EneatipoCard(new Eneatipo(
                      index,
                      "${ds['name']}",
                      "${ds['description']}",
                      new Color(int.parse(ds['color'].substring(1, 7),
                          radix: 16) +
                          0xFF000000),),);
                  });
            }),
      ),
    );
  }
}
