import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:markham_enterprises_inc/src/models/company.dart';
import 'package:markham_enterprises_inc/src/ui/animation/into.dart';
import 'package:markham_enterprises_inc/src/ui/animation/loop.dart';
import 'package:markham_enterprises_inc/src/ui/animation/overlay.dart';
import 'package:markham_enterprises_inc/src/ui/animation/page_transition.dart';
import 'package:markham_enterprises_inc/src/ui/theme_style.dart';
import 'package:markham_enterprises_inc/src/ui/work_card.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyDetails extends StatelessWidget {
  final Company company;
  final IntroAnimation animation;
  CompanyDetails(
      {@required this.company,
      @required AnimationController controller,
      @required this.devWidth,
      @required this.devHeight,
      @required this.cardHeight})
      : animation = IntroAnimation(controller);

  void openOverlay(BuildContext context, String title, String content) {
    Navigator.push(context,
        FadeRoute(widget: OverlayAnimation(content: content, title: title)));
    return;
  }

  final double devWidth;
  final double devHeight;
  final double cardHeight;
  double getSpaceBuffer() {
    double topHeight = (devWidth > 600 ? 350.0 : 260.0) + 30;
    double space = devHeight - (cardHeight + topHeight);
    //   print('Space $space');
    return space;
  }

  double getLogoPositionOffset() {
    return devHeight * 0.3;
  }

  void openLinks(
      BuildContext context, String title, String info, String url) async {
    if (Platform.isAndroid && await canLaunch(url)) {
      await launch(url);
      return;
    }
    openOverlay(context, title, info);
  }

  Widget _createWorkScroller() {
    return Transform(
      transform: Matrix4.translationValues(
          animation.workScrollerXTrans.value, 0.0, 0.0),
      child: SizedBox(
          height: cardHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            itemCount: company.works.length,
            itemBuilder: (BuildContext context, int idx) {
              var work = company.works[idx];
              return Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Opacity(
                      opacity: animation.worksOpacity.value,
                      child: WorkCard(work, cardHeight * 0.6)));
            },
          )),
    );
  }

  Widget _createLogoLinkTop(BuildContext context) {
    return Container(
      height: devWidth > 600 ? 230.0 : 150.0,
      margin: const EdgeInsets.only(top: 30.0, left: 5.0, right: 5.0),
      padding: const EdgeInsets.all(2.0),
      child: Opacity(
        opacity: animation.topBarOpacity.value,
        child: Row(
          children: <Widget>[
            Container(
              width: devWidth > 600 ? 200.0 : 120.0,
              child: LoopAnimations(company.logos),
            ),
            Container(
              width: devWidth > 600 ? (devWidth - 315.0) : (devWidth - 135.0),
              child: _createLinkButtons(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _createLinkButtons(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20.0,
        ),
        linkButton(
            company.links[0].name,
            () => openLinks(context, company.links[0].name,
                company.links[0].info, company.links[0].url)),
        linkButton(
            company.links[1].name,
            () => openLinks(context, company.links[1].name,
                company.links[1].info, company.links[1].url)),
      ],
    );
  }

  Widget _mainButtons(BuildContext context) {
    return Opacity(
      opacity: animation.mainButtonsOpacity.value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          mainButtons(
              'About', () => openOverlay(context, 'About', company.about)),
          SizedBox(
            width: 5.0,
          ),
          mainButtons('Technology',
              () => openOverlay(context, 'Technology', company.technology)),
          SizedBox(
            width: 5.0,
          ),
          mainButtons('Philosophy',
              () => openOverlay(context, 'Philosophy', company.philosophy)),
        ],
      ),
    );
  }

  Widget _customDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        color: Colors.white.withOpacity(0.8),
        margin: const EdgeInsets.symmetric(
          vertical: 14.0,
        ),
        width: devWidth * animation.dividerWidth.value,
        height: 1.0,
      ),
    );
  }

  Widget _createContent(BuildContext context) {
    double space = getSpaceBuffer();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _createLogoLinkTop(context),
          _customDivider(),
          _mainButtons(context),
          SizedBox(
            height: space,
          ),
          _createWorkScroller(),
        ],
      ),
    );
  }

  Widget _createAnimations(BuildContext context, Widget child) {
    return Stack(fit: StackFit.expand, children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: getLogoPositionOffset()),
        child: Container(
            alignment: Alignment.topCenter,
            child: LoopAnimations(company.backdropPhotos)),
      ),
      BackdropFilter(
        filter: ui.ImageFilter.blur(
            sigmaX: animation.bgDropBlur.value,
            sigmaY: animation.bgDropBlur.value),
        child: Container(
          color: Colors.black.withOpacity(0.3),
          child: _createContent(context),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animation.animationController,
        builder: _createAnimations,
      ),
    );
  }
}
