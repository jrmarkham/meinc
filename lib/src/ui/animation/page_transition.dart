import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder {
  final Widget widget;

  FadeRoute({this.widget})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder:
            (_, Animation<double> animation, __, Widget child) {
          return new FadeTransition(opacity: animation, child: child);
        });
}
