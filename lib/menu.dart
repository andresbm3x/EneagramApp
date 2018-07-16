import 'package:flutter/material.dart';

class MenuItem {
  final String id;
  final String title;
  final IconData icon;

  const MenuItem({this.id, this.title, this.icon});
}

const List<MenuItem> allMenuItems = const <MenuItem>[
  const MenuItem(
    id: "info",
    title: "Información",
  ),
  const MenuItem(
    id: "test",
    title: "Test Eneagrama",
  ),
  const MenuItem(
    id: "infoEne",
    title: "Información Eneatipos",
  ),
  const MenuItem(
    id: "config",
    title: "Configuración",
  ),
];

class MenuPage extends StatefulWidget {
  static const IconData defIcon = Icons.info;

  final Function onMenuItemSelected;

  MenuPage({this.onMenuItemSelected});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  MenuItem _currMenuItem = allMenuItems[0];

  void _changeMenuItem(MenuItem item){
    setState(() {
      _currMenuItem=item;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget>  menuItems = allMenuItems.map<Widget>((MenuItem item){
      final bool selected = item==_currMenuItem;
      return new Material(
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
        ),
        color: selected
            ? Colors.white.withOpacity(0.25)
            : Colors.transparent,
        child: new ListTile(
          title: new Text(item.title),
          selected: selected,
          onTap: () {
            widget.onMenuItemSelected(item.id);
            _changeMenuItem(item);
          },
        ),
      );
    }  ).toList();

    return new Container(
      child: new Center(
        child: new Column(children: <Widget>[
          new Image.network(
            "http://www.madanesschool.com/resources/ENEAGRAMA%20SYMBOL%20HQ%20transparencia%20full%20de%20logo%20frnando.png?timestamp=1393223535485",
            height: 150.0,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: menuItems,
            ),
          ),
        ]),
      ),
    );
  }
}


