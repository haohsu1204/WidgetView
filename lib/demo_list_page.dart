import 'package:flutter/material.dart';
import 'package:widget_view/lib/widget/curve_view.dart';
import 'package:widget_view/lib/widget/widget_view.dart';
import 'package:widget_view/widget/demo_list_cell.dart';

class DemoListPage extends StatefulWidget {
  @override
  _DemoListPageController createState() => _DemoListPageController();
}

class _DemoListPageController extends State<DemoListPage> {
  @override
  Widget build(BuildContext context) => _DemoListPageView(this);
}

class _DemoListPageView extends WidgetView<DemoListPage, _DemoListPageController> {
  _DemoListPageView(_DemoListPageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CurveAppBar(
            title: "Messages",
          ),
          Expanded(
            child: CurveWidget(
              radius: 42,
              child: ListView(
                children: [
                  ...unreadDemos.map((d) => DemoListCell(name: d.name, route: d.route, builder: d.builder,)),
                  ...readDemos.map((d) => DemoListCell2(name: d.name, route: d.route, builder: d.builder,)),
                ],
              ),
            ),
          ),
          CurveWidget(
            radius: 42,
            height: 164,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.green],
                    stops: [0.0, 0.5],
                  )
              ),
              child: Container(
                padding: EdgeInsets.only(top: 58, bottom: 58, left: 16, right: 16),
                child: FlatButton(
                  color: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                  },
                  child: Text("New Messages", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({this.name, this.route, this.builder});
}

final unreadDemos = [
  Demo(
  name: 'AnimatedContainer',
  route: "",
  builder: (context) => DemoListPage()),
  Demo(
  name: 'PageRouteBuilder',
  route: "",
  builder: (context) => DemoListPage()),
];
final readDemos = [
  Demo(
      name: 'AnimatedContainer',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'PageRouteBuilder',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'Animation Controller',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'Tweens',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'AnimatedBuilder',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'Custom Tween',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'Tween Sequences',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'Fade Transition',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'Fade Transition',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'Fade Transition',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'Fade Transition',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'Fade Transition',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'Fade Transition',
      route: "",
      builder: (context) => DemoListPage()),
  Demo(
      name: 'Fade Transition',
      route: "",
      builder: (context) => DemoListPage()),

];


class CurveAppBar extends StatefulWidget {

  final double radius = 42;
  final double height = 200 + 42 * 2.0;


  final String title;

  const CurveAppBar({Key key, this.title}) : super(key: key);

  @override
  _CurveAppBarController createState() => _CurveAppBarController();
}
 
class _CurveAppBarController extends State<CurveAppBar> {
  @override
  Widget build(BuildContext context) => _CurveAppBarView(this);
}

class _CurveAppBarView extends WidgetView<CurveAppBar, _CurveAppBarController> {
  _CurveAppBarView(_CurveAppBarController state) : super(state);

  final double radius = 42;
  final double height = 140 + 42 * 2.0;

  @override
  Widget build(BuildContext context) {
    return CurveWidget(
      height: height,
      radius: radius,
      child: Container(
        height: height,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(top: radius, bottom: radius),
          child: Align(
              alignment: Alignment.center,
              child: SafeArea(
                bottom: false,
                child: RichText(text: TextSpan(
                  text: state.widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                ),
                ),
              )
          ),
        ),
      ),
    );
  }
}