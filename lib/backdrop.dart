import 'package:eneatipos_test/eneagram_screen.dart';
import 'package:flutter/material.dart';

class BackDrop extends StatefulWidget {
  final String title;
  final Widget backPage;
  final EneagramScreen frontPage;
  AnimationController controller;

  BackDrop({this.title, this.backPage, this.frontPage,this.controller});

  @override
  _BackDropState createState() => new _BackDropState();
}

class _BackDropState extends State<BackDrop>
    with SingleTickerProviderStateMixin {
  static const _PANEL_HEADER_HEIGHT = 32.0;

  Animation<RelativeRect> _getPanelAnimation(BoxConstraints constraints) {
    final double height = constraints.biggest.height;
    final double top = height - _PANEL_HEADER_HEIGHT;
    final double bottom = -_PANEL_HEADER_HEIGHT;
    return new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(0.0, top, 0.0, bottom),
      end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(new CurvedAnimation(parent: widget.controller, curve: Curves.linear));
  }

  bool get _isPanelVisible {
    final AnimationStatus status = widget.controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void toggleMenu() {
    widget.controller.fling(velocity: _isPanelVisible ? -1.0 : 1.0);
  }

  Widget _backPanel(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.title,
          ),
          centerTitle: true,
          elevation: 0.0,
          leading: new IconButton(
            icon: new AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              progress: widget.controller.view,
            ),
            onPressed: () {
              toggleMenu();
            },
          ),
        ),
        body: LayoutBuilder(
          builder: _buildStack,
        ));
  }

  Widget _frontPane(BuildContext context) {
    return new Material(
      //color: Colors.transparent,
      elevation: 10.0,
      borderRadius: new BorderRadius.only(
        topRight: new Radius.circular(20.0),
        topLeft: new Radius.circular(20.0),
      ),

      child: Center(
        child: widget.frontPage.builder(context),
      ),
    );
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final Animation<RelativeRect> animation = _getPanelAnimation(constraints);
    final ThemeData theme = Theme.of(context);
    return new Container(
      color: theme.primaryColor,
      child: new Stack(
        children: <Widget>[
          widget.backPage,
          PositionedTransition(rect: animation, child: _frontPane(context)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _backPanel(context);
  }
}
