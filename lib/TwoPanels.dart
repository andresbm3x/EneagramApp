import 'package:eneatipos_test/info_page.dart';
import 'package:eneatipos_test/menu.dart';
import 'package:eneatipos_test/test_page.dart';
import 'package:flutter/material.dart';

class TwoPanels extends StatefulWidget {
  final AnimationController controller;

  TwoPanels({this.controller});

  @override
  _TwoPanelsState createState() => _TwoPanelsState();
}

class _TwoPanelsState extends State<TwoPanels> {
  static const header_height = 32.0;
  static const IconData defIcon=Icons.info;

  Animation<RelativeRect> getPanelAnimation(BoxConstraints constraints) {
    final height = constraints.biggest.height;
    final backPanelHeight = height - header_height;
    final frontPanelHeight = -header_height;

    return new RelativeRectTween(
            begin: new RelativeRect.fromLTRB(
                0.0, backPanelHeight, 0.0, frontPanelHeight),
            end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0))
        .animate(new CurvedAnimation(
            parent: widget.controller, curve: Curves.linear));
  }

  Widget bothPanels(BuildContext context, BoxConstraints constraints) {
    final ThemeData theme = Theme.of(context);

    String _page="info";
    Widget _curretPage = InfoPage();

    Widget _pageSelector() {
      if (_page=="info"){
        return new InfoPage();
      } else if (_page=="infoEne"){
        return new InfoPage();
      } else {
        return new TestPage();
      }
    }

    void _onTapItem(String tag) {
      setState(() {
        _page=tag;
        _curretPage=_pageSelector();
      });
    }


    Widget ItemMenu(String text,String tag,{IconData icon=defIcon}) {
      return GestureDetector(
        onTap: () => _onTapItem(tag),
        child: new Container(
          margin: new EdgeInsets.all(8.0),
          height: 45.0,
          decoration: BoxDecoration(color: Colors.green),
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
      child: Stack(
        children: <Widget>[
          new Container(
            color: theme.primaryColor,
            child: new Container(
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
                          ItemMenu("Información","info"),
                          ItemMenu("Información Eneatipos","infoEne"),
                          ItemMenu("Test de Eneagrama","test"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          new PositionedTransition(
            rect: getPanelAnimation(constraints),
            child: new Material(
              elevation: 12.0,
              borderRadius: new BorderRadius.only(
                  topRight: new Radius.circular(16.0),
                  topLeft: new Radius.circular(16.0)),
              child: new Column(
                children: <Widget>[
                  _curretPage,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new LayoutBuilder(builder: bothPanels);
  }
}

