import 'package:flutter/material.dart';
import 'package:widget_view/lib/widget/widget_view.dart';

class HomePage extends StatefulWidget {

  final String title;
  final String hintTitle = "You have pushed the button this many times:";
  final IconData icon;

  const HomePage({Key key, this.title, this.icon}) : super(key: key);

  @override
  _HomePageController createState() => _HomePageController();
}

class _HomePageController extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) => _HomePageView(this);

  void handleCounterPressed() => setState(() => counter += 1);
}

class _HomePageView extends WidgetView<HomePage, _HomePageController> {
  _HomePageView(_HomePageController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state.widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              state.widget.hintTitle,
            ),
            Text(
              '${state.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.handleCounterPressed,
        tooltip: 'Increment',
        child: Icon(state.widget.icon),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}