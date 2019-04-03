import 'package:flutter/material.dart';
import 'package:markham_enterprises_inc/src/models/company.dart';
import 'package:markham_enterprises_inc/src/ui/company_details.dart';
import 'package:markham_enterprises_inc/src/ui/theme_style.dart';

class App extends StatefulWidget {
  final Company company;
  App(this.company);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2500));
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double devWidth = MediaQuery.of(context).size.width;
    double devHeight = MediaQuery.of(context).size.height;
    setDeviceWidth(devWidth);
    return CompanyDetails(
      company: widget.company,
      controller: animationController,
      devWidth: devWidth,
      devHeight: devHeight,
      cardHeight: devWidth > 400 ? (devHeight * .32) : (devHeight * .45),
    );
  }
}
