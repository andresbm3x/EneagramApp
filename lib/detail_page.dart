import 'package:eneatipos_test/info_page.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Eneatipo _tipo;

  DetailPage(this._tipo) : assert(_tipo != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding:
          const EdgeInsets.only(bottom: 8.0, top: 80.0, left: 8.0, right: 8.0),
      child:
         Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(25.0),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(10.0),
              color: _tipo.color
            ),
              child: Text(_tipo.title, style: Theme.of(context).textTheme.title)),
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
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: new Offset(0.0, 10.0),
                    )
                  ]),
            ),
          ),
        ]),
    ));
  }
}
