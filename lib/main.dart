import 'package:eneatipos_test/TwoPanels.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Eneagrama',
        theme: new ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepPurple,
          textTheme: TextTheme(
            title: new TextStyle(color: Colors.white, fontSize: 26.0),
            body1: new TextStyle(color: Colors.white, fontSize: 16.0),
            subhead: new TextStyle(color: Colors.white, fontSize: 22.0),
          ),
        ),
        home: new BackdropPage());
  }
}

class BackdropPage extends StatefulWidget {
  @override
  _BackdropPageState createState() => _BackdropPageState();
}

class _BackdropPageState extends State<BackdropPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, duration: new Duration(microseconds: 100), value: 1.0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  bool get isPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Eneagrama",
          style: Theme.of(context).textTheme.title,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _controller.fling(velocity: isPanelVisible ? -1.0 : 1.0);
          },
          icon: new AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: _controller.view,
          ),
        ),
      ),
      body: new TwoPanels(
        controller: this._controller,
      ),
    );
  }
}
