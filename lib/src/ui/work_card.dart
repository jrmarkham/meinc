import 'dart:io';

import 'package:flutter/material.dart';
import 'package:markham_enterprises_inc/src/models/company.dart';
import 'package:markham_enterprises_inc/src/ui/animation/overlay.dart';
import 'package:markham_enterprises_inc/src/ui/animation/page_transition.dart';
import 'package:markham_enterprises_inc/src/ui/theme_style.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkCard extends StatelessWidget {
  WorkCard(this.work, this.width) {
    _link = !(this.work.url == 'na');
  }

  bool _link;
  final Work work;
  final double width;

  void openOverlay(BuildContext context, String title, String content) {
    Navigator.push(context,
        FadeRoute(widget: OverlayAnimation(content: content, title: title)));
    return;
  }

  BoxDecoration _shadowCorners() {
    return BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.0),
        border: getBorder(),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0)
        ]);
  }

  Widget _createThumbNail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Stack(
        children: <Widget>[
          Center(child: Image.asset(this.work.thumbnail)),
        ],
      ),
    );
  }

  Widget _createWorkInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 4.0, right: 0.0),
      child: Column(
        children: <Widget>[
          Text(work.title,
              textAlign: TextAlign.center, style: thumbTitleText()),
          Text(work.type, textAlign: TextAlign.center, style: thumbText()),
        ],
      ),
    );
  }

  void _launchWorkURL(context) async {
    if (Platform.isAndroid && await canLaunch(work.url)) {
      await launch(work.url);
      return;
    }

    openOverlay(context, work.title, work.info);
  }

  Widget _createThumbContainer() {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      decoration: _shadowCorners(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: _createThumbNail(),
          ),
          Flexible(flex: 2, child: _createWorkInfo())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!this._link) {
      return _createThumbContainer();
    } else {
      return GestureDetector(
        onTap: () => _launchWorkURL(context),
        child: _createThumbContainer(),
      );
    }
  }

  Border getBorder() {
    if (this._link) {
      return Border.all(width: 2.0, color: Colors.red);
    }
    return Border.all(width: 1.0, color: Colors.blueGrey);
  }
}
