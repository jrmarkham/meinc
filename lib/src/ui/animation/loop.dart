import 'package:flutter/material.dart';

class LoopAnimations extends StatefulWidget {
  final List<String> images;
  LoopAnimations(this.images);

  @override
  _LoopAnimationsState createState() => _LoopAnimationsState();
}

class _LoopAnimationsState extends State<LoopAnimations>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  String _imageAssetURL;
  int idx = 0;
  bool change = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageAssetURL = widget.images[idx];
    _controller = AnimationController(vsync: this)
      ..repeat(
          max: 0.75, min: 0.25, reverse: true, period: Duration(seconds: 8));
    _controller.addListener(() {
      setState(() {
        if (change && _controller.value < 0.27) {
          idx++;
          if (idx > widget.images.length - 1) idx = 0;
          _imageAssetURL = widget.images[idx];
          change = false;
        }
        if (!change && _controller.value > 0.7) change = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: _controller.value,
        child: Image.asset(
          _imageAssetURL,
        ));
  }
}
