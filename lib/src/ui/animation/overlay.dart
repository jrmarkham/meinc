import 'package:flutter/material.dart';
import 'package:markham_enterprises_inc/src/ui/theme_style.dart';

class OverlayAnimation extends StatefulWidget {
  String content;
  String title;
  OverlayAnimation({this.title, this.content});
  @override
  _OverlayAnimationState createState() => _OverlayAnimationState();
}

class _OverlayAnimationState extends State<OverlayAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _closing = false;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _controller.addListener(() {
      setState(() {});
      if (_closing && _controller.value < 0.01) {
        _closing = false;
        Navigator.of(context).pop();
        dispose();
      }
    });
    _controller.forward();
  }

  void _close() {
    _closing = true;
    _controller.reverse();
  }

  Widget _topBar() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 9,
          child: Center(
            child: Text(
              widget.title,
              style: titleText(),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.red,
            ),
            onPressed: _close,
          ),
        )
      ],
    );
  }

  Widget _contentList() {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Text(
          widget.content,
          style: mainText(),
        ),
      ),
    );
  }

  Widget _getDisplay() {
    return Opacity(
        opacity: _controller.value,
        // mark container full screen //
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 20.0, top: 40.0),
            child: Column(
              children: <Widget>[_topBar(), _contentList()],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _getDisplay();
  }
}
