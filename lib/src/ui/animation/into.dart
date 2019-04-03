import 'package:flutter/material.dart';

class IntroAnimation {
  final AnimationController animationController;
  final Animation<double> bgDropBlur;
  final Animation<double> topBarOpacity;
  final Animation<double> dividerWidth;
  final Animation<double> mainButtonsOpacity;
  final Animation<double> workScrollerXTrans;
  final Animation<double> worksOpacity;

  IntroAnimation(this.animationController)
      : bgDropBlur = Tween(begin: 0.5, end: 1.0).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.000, 0.400, curve: Curves.ease))),
        topBarOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.300, 0.600, curve: Curves.ease))),
        dividerWidth = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.400, 0.700, curve: Curves.ease))),
        mainButtonsOpacity = Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.500, 0.800, curve: Curves.ease))),
        workScrollerXTrans = Tween(begin: 60.0, end: 0.0).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(0.600, 0.900, curve: Curves.ease))),
        worksOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.600, 0.900, curve: Curves.ease)));
}
