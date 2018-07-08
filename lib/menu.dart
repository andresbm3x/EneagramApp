import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {

  static const IconData defIcon=Icons.info;

  @override
  Widget build(BuildContext context) {
    Widget ItemMenu(String text,VoidCallback onTapItem,{IconData icon=defIcon}) {
      return GestureDetector(
        onTap: onTapItem,
        child: new Container(
          margin: new EdgeInsets.all(8.0),
          height: 45.0,
          //decoration: BoxDecoration(color: Colors.green),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(icon,color: Colors.white,),
              Container(
                margin: EdgeInsets.only(left:20.0,top: 0.0,right: 0.0,bottom: 0.0),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: new Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ),
            ],
          ),
          padding: new EdgeInsets.all(12.0),
        ),
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
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: new Column(
                children: <Widget>[
                  ItemMenu("Información",(){

                  }),
                  ItemMenu("Información Eneatipos",(){

                  }),
                  ItemMenu("Test de Eneagrama",(){

                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
