import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markham_enterprises_inc/src/models/company.dart';
import 'package:markham_enterprises_inc/src/repo/hc_repo.dart';
import 'package:markham_enterprises_inc/src/ui/app.dart';
import 'package:markham_enterprises_inc/src/ui/theme_style.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    final Company company = HardCodedRepo.me;
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        title: company.name,
        theme: meThemeData(),
        home: App(company)));
  });
}
