import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          new Container(
            height: 35.0,
          ),
          Expanded(
            child: new Stack(
              children: <Widget>[

                Center(
                  child: Text(
                    "Test",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  child: new FloatingActionButton(
                    onPressed: () {},
                    elevation: 10.0,
                    tooltip: "Nuevo Test",
                    child: Icon(Icons.add),
                  ),
                  alignment: Alignment(0.90, 0.90),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
