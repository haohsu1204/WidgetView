import 'package:flutter/material.dart';
import 'package:widget_view/lib/widget/widget_view.dart';

class CurveWidget extends StatefulWidget {

  final double radius;
  final double height;
  final Widget child;
  final bool isTopOverlapping;
  final bool isBottomOverlapping;
  final double topMargin;
  final double bottomMargin;

  const CurveWidget({Key key, this.child, this.radius = 0, this.height = 0, this.topMargin = 0, this.bottomMargin = 0, this.isTopOverlapping = true, this.isBottomOverlapping = true}) : super(key: key);

  @override
  _CurveWidgetController createState() => _CurveWidgetController();
}

class _CurveWidgetController extends State<CurveWidget> {
  @override
  Widget build(BuildContext context) => _CurveWidgetView(this);
}

class _CurveWidgetView extends WidgetView<CurveWidget, _CurveWidgetController> {
  _CurveWidgetView(_CurveWidgetController state) : super(state);

  @override
  Widget build(BuildContext context) {
    double contentHeight = widget.height > widget.radius * 2 ? widget.height - widget.radius * 2 : 0;
    double topMargin = widget.isTopOverlapping? -widget.radius + widget.topMargin : 0;
    double bottomMargin = widget.isBottomOverlapping? -widget.radius + widget.bottomMargin : 0;
    return Container(
      height: contentHeight,
        child: Stack(
            overflow: Overflow.visible,
            children: [
              Positioned(
                  top: topMargin,
                  left: 0,
                  right: 0,
                  bottom: bottomMargin,
                  child: ClipPath(
                    clipper: _MyPathClipper(radius: widget.radius),
                    child: widget.child
                  ),
              )
            ]
        ),
    );
  }
}


class _MyPathClipper extends CustomClipper<Path> {

  final double radius;

  const _MyPathClipper({Key key, this.radius}) : super();

  @override
  Path getClip(Size size) {
    var path = Path()
    ..moveTo(0, 0)
    ..arcToPoint(
      Offset(radius,radius),
      clockwise: false,
      radius: Radius.circular(radius)
    )
    ..lineTo(size.width - radius, radius)
    ..arcToPoint(
        Offset(size.width,radius * 2),
        clockwise: true,
        radius: Radius.circular(radius)
    )
    ..lineTo(size.width, size.height)
    ..arcToPoint(
        Offset(size.width - radius, size.height - radius),
        clockwise: false,
        radius: Radius.circular(radius)
    )
    ..lineTo(radius, size.height - radius)
    ..arcToPoint(
        Offset(0, size.height - radius*2),
        clockwise: true,
        radius: Radius.circular(radius)
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}