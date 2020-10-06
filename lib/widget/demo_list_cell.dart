import 'package:flutter/material.dart';
import 'package:widget_view/lib/widget/curve_view.dart';
import 'package:widget_view/lib/widget/widget_view.dart';

class DemoListCell extends StatefulWidget {

  final String name;
  final String route;
  final WidgetBuilder builder;

  const DemoListCell({this.name, this.route, this.builder});

  @override
  _DemoListCellController createState() => _DemoListCellController();
}

class _DemoListCellController extends State<DemoListCell> {
  @override
  Widget build(BuildContext context) => _DemoListCellView(this);

  void handleListTap() {
    Navigator.pushNamed(context, widget.route);
  }
}

class _DemoListCellView extends WidgetView<DemoListCell, _DemoListCellController> {
  _DemoListCellView(_DemoListCellController state) : super(state);

  final List<Color> _colors = [Colors.blueGrey, Colors.white];
  final List<double> _stops = [0.0, 0.35];
  final double height = 182;
  final double radius = 42;

  @override
  Widget build(BuildContext context) {
    return CurveWidget(
      height: height,
      radius: radius,
      child: GestureDetector(
        onTap: state.handleListTap,
        // The custom button
        child: Container(
          height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: _colors,
                stops: _stops,
              )
          ),
          child: Container(
            padding: EdgeInsets.only(top: 58, bottom: 58, left: 16, right: 16),
            child: RichText(text:
              TextSpan(
                text: state.widget.name,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class DemoListCell2 extends StatefulWidget {

  final String name;
  final String route;
  final WidgetBuilder builder;

  const DemoListCell2({Key key, this.name, this.route, this.builder}) : super(key: key);

  @override
  _DemoListCell2Controller createState() => _DemoListCell2Controller();
}

class _DemoListCell2Controller extends State<DemoListCell2> {
  @override
  Widget build(BuildContext context) => _DemoListCell2View(this);

  void handleListTap() {
    Navigator.pushNamed(context, widget.route);
  }
}

class _DemoListCell2View extends WidgetView<DemoListCell2, _DemoListCell2Controller> {
  _DemoListCell2View(_DemoListCell2Controller state) : super(state);

  final List<Color> _colors = [Colors.blueGrey];
  final List<double> _stops = [0.0];
  final double height = 182;
  final double radius = 42;

  @override
  Widget build(BuildContext context) {
    return CurveWidget(
      height: height,
      radius: radius,
      bottomMargin: 4,
      child: GestureDetector(
        onTap: state.handleListTap,
        // The custom button
        child: Container(
          height: height,
          color: Colors.blueGrey,

          child: Container(
            padding: EdgeInsets.only(top: 58, bottom: 58, left: 16, right: 16),
            child: RichText(text:
            TextSpan(
              text: state.widget.name,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            ),
          ),
        ),
      ),
    );
  }
}