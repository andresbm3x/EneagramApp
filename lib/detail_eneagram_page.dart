import 'package:eneatipos_test/info_eneagram_page.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Eneatipo _tipo;

  DetailPage(this._tipo) : assert(_tipo != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: _tipo.color),
        padding: const EdgeInsets.only(
            bottom: 8.0, top: 26.0, left: 8.0, right: 8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: 25.0, bottom: 8.0, left: 8.0, right: 8.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back, color:Colors.white,),
                      onPressed: () =>
                        Navigator.of(context).pop()
                    ),
                    Hero(tag: _tipo.title,child: new Icon(_tipo.icon, color: Colors.white,size: 80.0,)),
                    Container(
                      margin: new EdgeInsets.all(10.0),
                      child: Text(
                        _tipo.title,
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  height: 50.0,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(_tipo.description,
                        style: Theme.of(context).textTheme.body1),
                  ),
                  decoration: new BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.circular(19.0),
                      boxShadow: <BoxShadow>[
                        new BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        )
                      ]),
                ),
              ),
            ]),
      ),
    );
  }
}
